#!/usr/bin/ruby
#
# This probably isn't the script you're looking for.
#
# See mac-curl-recert.sh.

require 'date'

class Cert
  def initialize
    @s = ''
  end

  def append(s)
    @s << s
  end

  def complete?
    @s.match(/END CERTIFICATE/) ? true : false
  end

  def expired?
    mtch = @s.match /Not After : (\w\w\w) +(\d{1,2}) \d\d:\d\d:\d\d (\d{4})/
    if mtch
      (mon, mday, year) = mtch[1..3]
      Date.parse("#{mon} #{mday} #{year}") < Date.today
    end
  end

  def to_s
    @s
  end

  def ==(other)
    to_s == other.to_s
  end
end

def slurp(path, certs)
  cert = Cert.new
  f = File.new(path)
  f.each_line do |line|
    cert.append(line)
    if cert.complete?
      if !certs.include?(cert)
        certs << cert
      end
      cert = Cert.new
    end
  end
  f.close
end

ARGV.unshift '/etc/ssl/cert.pem' if ARGV.empty?

certs = []

ARGV.each do |path|
  slurp(path, certs)
end

certs.reject! { |cert| cert.expired? }

certs.each do |cert|
  puts cert.to_s
end

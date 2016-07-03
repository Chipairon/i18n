class Hash
  def slice(*keep_keys)
    h = {}
    keep_keys.each { |key| h[key] = fetch(key) if has_key?(key) }
    h
  end unless Hash.method_defined?(:slice)

  def except(*less_keys)
    slice(*keys - less_keys)
  end unless Hash.method_defined?(:except)

  # deep_merge_hash! by Stefan Rusterholz, see http://www.ruby-forum.com/topic/142809
  MERGER = proc do |key, v1, v2|
    Hash === v1 && Hash === v2 ? v1.merge(v2, &MERGER) : v2
  end

  def deep_merge!(data)
    merge!(data, &MERGER)
  end unless Hash.method_defined?(:deep_merge!)
end


# frozen_string_literal: true

# Command template
class Command
  def validate(*_args)
    raise NotImplementedError, 'command must implements validate method'
  end

  def run(*_args)
    raise NotImplementedError, 'command must implements run method'
  end

  def execute(args)
    args = args.split(' ') if args.instance_of? String
    validate(args)
    run(*args)
  end
end

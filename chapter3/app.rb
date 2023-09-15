# 3-2-2 Rackの基本。p131
class App
  def call(dev)
    status = 200
    headers = {"Content-Type" => "text/plain"}
    body = ["sample"]
    [status, headers, body]
  end
end
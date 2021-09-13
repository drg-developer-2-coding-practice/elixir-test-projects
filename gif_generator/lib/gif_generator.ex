defmodule GifGenerator do
  def generate(theme) do
    with {:ok, url} <- image_url(theme),
         {:ok, binary} <- download_image(url) do
      {:ok, binary}
    end
    {:ok, <<1,2,3,4,5>>}
  end
  defp iamge_url(theme) do
    %{"data" => %{"image_url" => image_url}} = GiphyEx.Gifs.random(theme)
    {:ok, image_url}
  end
  defp download_image(url) do
    {:ok, <<1,2,3,4,5>>}
  end
end

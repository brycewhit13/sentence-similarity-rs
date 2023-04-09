// Crates
use serde_json::json;

// Functions
pub async fn sentence_similarity(prompt1: &str, prompt2: &str) -> f64 {
    let model = "all-MiniLM-L6-v2";
    let url = format!("https://api-inference.huggingface.co/models/sentence-transformers/{model}");
    // Instantiate the payload
    let payload = json!({
        "inputs": json!({
            "source_sentence": prompt1,
            "sentences": [prompt2]
        })
    });

    // Instantiate the client and send the request
    let client = reqwest::Client::new();
    let res = client.post(url).json(&payload).send().await.unwrap();

    // Extract the similarity and round it to 2 decimal places
    let body = res.json::<serde_json::Value>().await.unwrap();
    let similarity = &body[0].as_f64().unwrap();

    // return the similarity
    (similarity * 10000.0).round() / 100.0
}

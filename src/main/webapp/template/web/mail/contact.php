  <?php
  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Kiểm tra các trường bắt buộc
    if (empty($_POST['name']) || empty($_POST['subject']) || empty($_POST['message']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
      http_response_code(400); // Trả về mã 400 nếu có lỗi đầu vào
      echo json_encode(["status" => "error", "message" => "Invalid input."]);
      exit();
    }

    // Làm sạch dữ liệu
    $name = strip_tags(htmlspecialchars($_POST['name']));
    $email = strip_tags(htmlspecialchars($_POST['email']));
    $m_subject = strip_tags(htmlspecialchars($_POST['subject']));
    $message = strip_tags(htmlspecialchars($_POST['message']));

    // Đặt email nhận
    $to = "longdnguyen1411@gmail.com"; // Thay đổi địa chỉ email này theo yêu cầu của bạn
    $subject = "$m_subject: $name";
    $body = "Bạn có tin nhắn từ lều báo.\n\n" .
      "Đây là nội dung:\n\nName: $name\n\nEmail: $email\n\nSubject: $m_subject\n\nMessage: $message";
    $header = "From: $email\r\n";
    $header .= "Reply-To: $email\r\n";
    $header .= "Content-Type: text/plain; charset=UTF-8\r\n";

    // Gửi email
    if (mail($to, $subject, $body, $header)) {
      http_response_code(200); // Trả về mã 200 nếu thành công
      echo json_encode(["status" => "success", "message" => "Message sent successfully."]);
    } else {
      http_response_code(500); // Trả về mã 500 nếu có lỗi khi gửi email
      echo json_encode(["status" => "error", "message" => "Failed to send message."]);
    }
  } else {
    http_response_code(405); // Trả về mã 405 nếu phương thức không phải POST
    echo json_encode(["status" => "error", "message" => "Method not allowed."]);
  }
  ?>
  

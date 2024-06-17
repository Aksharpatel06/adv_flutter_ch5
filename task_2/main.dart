import 'modal/comment_modal.dart';
import 'utils/data.dart';

void main()
{
  for(int i=0;i<commentsList.length;i++)
  {
    CommentModal commentModal = CommentModal.fromJson(commentsList[i]);

    print("${commentModal.id} person details\n");

    print("postId: ${commentModal.postId}");
    print("id: ${commentModal.id}");
    print("name: ${commentModal.name}");
    print("email: ${commentModal.email}");
    print("body: ${commentModal.body}\n\n");
  }
}
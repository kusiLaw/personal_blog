# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
vida = User.create(name: 'Vida', photo: 'https://media.istockphoto.com/id/856599656/photo/passport-picture-of-a-smiling-turkish-businesswoman.jpg?s=612x612&w=0&k=20&c=dgETy-9neViQs7SATDTOOa80QOhVFcLIomBFRxWVN_8=',
                   bio: 'Lawyer from Mexico.')
lilly = User.create(name: 'Lilly', photo: 'https://www.persofoto.com/images/vorher-nachher/passfoto-beispiel-nachher.jpg', 
                    bio: 'Teacher from Poland.')

yeboa = User.create(name: 'Yeboa', photo: 'https://media.istockphoto.com/id/502581380/photo/portrait-of-an-african-american-man-with-glasses.jpg?s=1024x1024&w=is&k=20&c=GR-k4kD5k1LtDs75flblg06nem6UZ_8m8as3TnXwvSM=', 
                    bio: 'Engineer from UK.')

peter = User.create(name: 'Peter', photo: 'https://media.istockphoto.com/id/913062404/photo/face-of-businessman-against-white-background.jpg?s=612x612&w=is&k=20&c=vKjK7CZ61qM0EJeWl26X5WtOBQuEarWPlGRhMkgHx-8=', 
                    bio: 'Engineer from UK.')

frank = User.create(name: 'Frank', photo: 'https://media.istockphoto.com/id/480286744/photo/portrait-of-a-german-businessman-with-beard.jpg?s=612x612&w=is&k=20&c=Tod5GAEkrKqPJfQBl8CxKAs9x3EZAMDUOfdUwbZ887g=', 
                    bio: 'Engineer from UK.')


peter_post = Post.create(author: peter, title: 'Story About Peter',
                         text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit.')

peter_post_two = Post.create(author: peter, title: 'Peter and the Family',
                             text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit.')
peter_post_three = Post.create(author: peter, title: 'Peter First Day At School',
                               text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit.')                    
peter_post_four = Post.create(author: peter, title: 'Peter First Daughter',
                              text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit.')
vida_post = Post.create(author: vida, title: 'Story About Vida',
                        text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit.')
lilly_post = Post.create(author: lilly, title: 'Story About Lilly',
                         text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
                         molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                         numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
                         optio,')
lilly_second_post = Post.create(author: lilly, title: 'Teaching philosophy',
                                text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
                                molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                                numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
                                optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis
                                obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam
                                nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,
                                tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,
                                quia')
yeboa_post = Post.create(author: yeboa, title: 'Story About Yeboa',
                         text: 'orem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
                         molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                         numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
                         optio, eaque rerum')

frank_post = Post.create(author: frank, title: 'Story About Frank',
                         text: 'psum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
                         molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                         numquam blanditiis')
frank_second_post = Post.create(author: frank, title: 'My Experience as Software Engineer',
                                text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
                                molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                                numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
                                optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis
                                obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam
                                nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,
                                tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,
                                quia')

Comment.create(post: lilly_second_post, author: peter, text: 'Hi Lilly!, psum dolor sit amet consectetur adipisicing')
Comment.create(post: lilly_second_post, author: frank, text: 'Impedit sit sunt quaerat, odit,
                                                              tenetur error, harum nesciunt ipsum debitis quas,')

Comment.create(post: frank_second_post, author: lilly, text: 'Hi Frank!, psum dolor sit amet consectetur adipisicing ')
Comment.create(post: frank_second_post, author: vida, text: 'Hello Frank!,harum nesciunt ipsum debitis quas aliquid')
Comment.create(post: frank_second_post, author: peter, text: 'accusantium nemo autem harum nesciunt ipsum  aliquid')
Comment.create(post: frank_second_post, author: yeboa, text: 'similique accusantium nemo autem Hello Frank!,')
Comment.create(post: frank_second_post, author: lilly, text: 'Provident similique accusantium nemo autem,')
Comment.create(post: frank_second_post, author: peter, text: 'harum nesciunt ipsum debitis quas aliquid,')



Comment.create(post: vida_post, author: yeboa, text: 'Hello Vida!,Provident similique accusantium nemo autem')
Comment.create(post: yeboa_post, author: lilly, text: 'Hello Yeboad!,Provident similique accusantium nemo autem')

Like.create([{ post: lilly_post, author: vida }, { post: lilly_second_post, author: peter },
             { post: lilly_second_post, author: frank },

             { post: frank_second_post, author: yeboa }, { post: frank_second_post, author: lilly },
             { post: frank_second_post, author: vida },

             { post: yeboa_post, author: vida },
             { post: vida_post, author: yeboa },
             { post: peter_post, author: yeboa }])

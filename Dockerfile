FROM mibexx/docker-for-testing:environment
MAINTAINER Mike Bertram <contact@mibexx.de>

ENV SSH_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCme4LH0FRc+VyqpQY4sa42I5KX5AF4nMU4McsG2APu8meLOMjFdzy46ey3iMnnZG/DZq0XAu1fAjUfWiw4EJynjXxhWT7pasQzuQJGDE445EqUbyRtOz+oO4Kk1GFU3YHqdkTFmWmgP0g+KkE8WVFhrf57kHgYap2LXQ4YIBXT+ACFyYaz+HbIFWc20nIZjnHTOSTVUoZxfvY0ERkNmY8LEQZ1J9X1d35NpKxPC9cwP6fjPq4bIxl/p3z4Bq7r4OIpKAIeSIPriZH+/IBvMatMIeg2oRNNZQdm6O9sG9WXD1Qaw9die2F/NX6VHZ2Yc8DYre/WPDcdTrjs6tvIf/Bt mib"

RUN echo $SSH_KEY >> /root/.ssh/authorized_keys
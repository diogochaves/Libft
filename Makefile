# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dchaves- <dchaves-@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/09 14:31:22 by dchaves-          #+#    #+#              #
#    Updated: 2022/04/28 19:15:54 by dchaves-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# PATH VARIABLES
BIN_PATH	:=	./bin/
INC_PATH	:=	./inc/
OBJ_PATH	:=	./obj/
SRC_PATH	:=	./src/

# COMPILATION
CC			:=	gcc
CFLAGS		:=	-Wall -Wextra -Werror
LIB			:=	ar -rc

# BASH COMMANDS
RM 			:=	rm -f

# FILES
NAME		:=	$(BIN_PATH)libft.a
HEADER		:=	$(INC_PATH)libft.h

SRC_FILES 	:=	ft_isalpha.c \
				ft_isdigit.c \
				ft_isalnum.c \
				ft_isascii.c \
				ft_isprint.c \
				ft_strlen.c \
				ft_memset.c \
				ft_bzero.c \
				ft_memcpy.c \
				ft_memmove.c \
				ft_strcpy.c \
				ft_strlcpy.c \
				ft_strlcat.c \
				ft_toupper.c \
				ft_tolower.c \
				ft_strchr.c \
				ft_strrchr.c \
				ft_strncmp.c \
				ft_memchr.c \
				ft_memcmp.c \
				ft_strnstr.c \
				ft_atoi.c \
				ft_atoi_base.c \
				ft_calloc.c \
				ft_strdup.c \
				ft_substr.c \
				ft_strjoin.c \
				ft_strtrim.c \
				ft_split.c \
				ft_itoa.c \
				ft_strmapi.c \
				ft_striteri.c \
				ft_putchar_fd.c \
				ft_putstr_fd.c \
				ft_putendl_fd.c \
				ft_putnbr_fd.c \
				ft_lstnew.c \
				ft_lstadd_front.c \
				ft_lstsize.c \
				ft_lstlast.c \
				ft_lstadd_back.c \
				ft_lstdelone.c \
				ft_lstclear.c \
				ft_lstiter.c \
				ft_lstmap.c	\
				get_next_line.c		
SOURCES		:=	$(addprefix $(SRC_PATH), $(SRC_FILES))
OBJ_FILES	:=	$(patsubst %.c, %.o, $(SRC_FILES))
OBJECTS 	:=	$(addprefix $(OBJ_PATH), $(OBJ_FILES))

all:			$(NAME)

# -> creates executable inside ./bin/
$(NAME):		$(OBJECTS)
				$(LIB) $(NAME) $(OBJECTS)

# -> creates object files inside ./obj/
$(OBJ_PATH)%.o:	$(SRC_PATH)%.c | path
				$(CC) $(CFLAGS) -I $(INC_PATH) -c $< -o $@

path:
				mkdir -p $(OBJ_PATH)
				mkdir -p $(BIN_PATH)

clean:
				$(RM) $(OBJECTS)

fclean:			clean
				$(RM) $(NAME)

re:				fclean all

.PHONY: 		all clean fclean re

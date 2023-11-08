/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gabrodri <gabrodri@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/08 09:38:27 by gabrodri          #+#    #+#             */
/*   Updated: 2023/11/08 09:38:28 by gabrodri         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"

char	*get_next_line(int fd)
{
	int			bytes;
	char		*buffer;
	char		*result;
	static char	*line_buffer;

	if (fd < 0 || BUFFER_SIZE <= 0)
		return (NULL);
	buffer = (char *)malloc((BUFFER_SIZE + 1) * sizeof(char));
	if (!buffer)
		return (NULL);
	while (ft_strchr(line_buffer, '\n') == NULL && (bytes = ft_read(fd, &line_buffer, buffer)) > 0)
		;
	ft_free(&buffer);
	if (bytes == -1 || ft_strlen(line_buffer) == 0)
		return (NULL);
	result = ft_strdup(line_buffer);
	ft_free(&line_buffer);
	return (result);
}

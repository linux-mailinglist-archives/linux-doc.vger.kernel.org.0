Return-Path: <linux-doc+bounces-76447-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPwdFj3EmGl/LwMAu9opvQ
	(envelope-from <linux-doc+bounces-76447-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 20 Feb 2026 21:29:49 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B073716AA7B
	for <lists+linux-doc@lfdr.de>; Fri, 20 Feb 2026 21:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46E64304D969
	for <lists+linux-doc@lfdr.de>; Fri, 20 Feb 2026 20:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918682FD1C5;
	Fri, 20 Feb 2026 20:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPrSUvWK"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B232DC349
	for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 20:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771619291; cv=none; b=ZxMSJrsZiubaA+GJmxb9E7m4I5VR2ETqWuCtYljrrk4RZ5XxI2mdm2M7Y25tW2fJYKTkv6ZZ8lGWiE0YtU7IYf9a/TZIaOysSKUIdgT4xPK3qcR7DUgjO0sgYwNyHjpahNNj2j1YpvxwM0YN3y4vpG9XAHsjKaSlxObYayuhPKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771619291; c=relaxed/simple;
	bh=453Nn33A6CH7Mz/45At7JAf2+k/ZAtcCyKZ2EEaamaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y60TK+6z1U2Kd6GdF9wh5hidxyQjiS5OKQtLlj5PSrBsPvX4LfhfUYx0lA8NpADhels/VEdprwL3b3H0wfc8llFQ31LT3TujoT16CHi5QgzSQ05UenEFOolOyfxLpUmsPPTY8Ws/cMSZNdnLwQaarJh2ZasK/Qd6npZGwwJbGzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPrSUvWK; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1273349c56bso3108196c88.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 12:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771619290; x=1772224090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NoEzpa83rpLl4Wtm4BAGaxdkwBWEUosdcFCYVTg8N0=;
        b=IPrSUvWKyX5/3eeG6EA8pz4cg/2ohAVCaViII0p1t/Z6B6Apcf9+MyGFnA+teKWhBB
         MeRkFWfbnkRYUQeZdQu0E5UwEgP8VQ4SlztRgZypGD5R7IBeCvcyqCvlcfaZpidNoNFF
         0++V9CZ1rxx80MQsGfXozx28YwRghxrGO/ZSOHDgbukipqvTZzfQrDSgzqXXalU1ObvC
         A3dtAfrditgPi3ut4NI7NOr2G3CzPIU4Db6/dD9R3G51zDu/CQ+bfjaFZXRtCtp5nvoT
         RHxkf6K97j35uZRc/fmsEWMXM6b9RpHHbtIpoAPQQDl42dgz9eeAaYaOrl1QJyamdK+c
         xDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771619290; x=1772224090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2NoEzpa83rpLl4Wtm4BAGaxdkwBWEUosdcFCYVTg8N0=;
        b=w/xFcVHBvpa6PvzljGn2tokEyOMON1tauV5agqmClgzDhdRHZyQiYmlbNEm987nQCs
         2h2fPNcpXK+3+xC7VjicQtY4q0Cb+doK2K4mDzdpYrzISaTAfnp7TCyElWjVEfeRckV+
         jKsUWdlwFu+7oU3cr4olBNZe/Y5M7czmpE8bJBJPHxCeuBlyd6Ilfp5wqnq867lzF+5m
         8o+zIMX81EUsIJBNPR/N2oXB6tkrpyLttvTeaXAli1OwlaU3hQSRI6u0jVUOM4XwqrvA
         CULDLh3tCWbgKg026OD5cWjSHCAEnHNLEOGRkOZRazMHT0UFlpxDALzo3tTIWuo62fdh
         b04A==
X-Forwarded-Encrypted: i=1; AJvYcCX/A+SNlmFS+Dv9PsFC6/QNwDLLouwmeLgtu3ak7KvlbVMlQgJnUBB7ECf1OARjhPGkCqp/3yf663Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg+DQGxXKn7DHmM3GyTV3EaeqTUj6kvp3mGb/IXtWRSEjJHTMb
	kXH6fIj7sjCRnGqy3rLt74a04bsQ6iysW+HakTIfCfhT6vPKpqjNSH/s
X-Gm-Gg: AZuq6aKT2Lvci8smCYqr944Jw83BhwvYk4VLTw04s6hfCSroYz1bIBr/1npw454HFNK
	hPPwI/mdVpeoacDfKcQh48oBMIrw3yDvienESoJDiL8dG0lSSvSKbYHLwCsXZnT672HRR53Uz1k
	t/UlkdyS/8/gBYvFF5d+j/srefqpz0XdSOZyhuoOk/pivPTTG9MwOpgR1V5DVf96I6FWmc206m4
	GSN5o4v0iPYyPDx5t6CrV6IgnWHvYsXFgHhvpZGLDIjo+76BEQ4LUUL/kOy9O8/NB011pYfUW9S
	iZVLldQOsiZSMYBLqBY1rWQDcbAqgRJoiPbJWb+OORpVDPwvhqASrEz4qd7b1z67RwLSGsZImqM
	XZ1GnD/yCJat1wwEtyIejNYBT/zSsifzn3WLyZkPzaNJbo7W00N+63pvlFpyU+AnpI+1Ikqnw8e
	0T8Pn4JQjpiUcQ17q5vz9TUpcEHS6s7TeZA+F0qj6q5fe6W10=
X-Received: by 2002:a05:7022:603:b0:11d:c04a:dc5b with SMTP id a92af1059eb24-1276ad2e360mr394054c88.30.1771619289545;
        Fri, 20 Feb 2026 12:28:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af2edd7sm510403c88.8.2026.02.20.12.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 12:28:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 20 Feb 2026 12:28:08 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Varasina Farmadani <sina@sinanonym.my.id>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (asus-ec-sensors) add ROG STRIX X470-F GAMING
Message-ID: <6fe53fd7-fbb6-4b0a-b4e8-3daaef3d9a55@roeck-us.net>
References: <20260215151743.20138-1-eugene.shalygin@gmail.com>
 <20260215151743.20138-4-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215151743.20138-4-eugene.shalygin@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-76447-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,roeck-us.net:mid,sinanonym.my.id:email]
X-Rspamd-Queue-Id: B073716AA7B
X-Rspamd-Action: no action

On Sun, Feb 15, 2026 at 04:16:19PM +0100, Eugene Shalygin wrote:
> From: Varasina Farmadani <sina@sinanonym.my.id>
> 
> Add support for ROG STRIX X470-F GAMING
> 
> Signed-off-by: Varasina Farmadani <sina@sinanonym.my.id>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter


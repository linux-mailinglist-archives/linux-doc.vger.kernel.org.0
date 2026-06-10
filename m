Return-Path: <linux-doc+bounces-91849-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ePgnNaJjKWpvWAMAu9opvQ
	(envelope-from <linux-doc+bounces-91849-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 15:16:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B17C669A35
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 15:16:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="qUE/wG40";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91849-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91849-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FC65306A99B
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 13:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A4F408023;
	Wed, 10 Jun 2026 13:12:32 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A29D402BB7
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 13:12:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097152; cv=none; b=pt/n1HHxiHy57rezM0tjMOB43wK4qw83BXg6W3YyN0v6Oy6HwKHZG+W53d6ZSrYLa3Sn9Ao7lMqYSrSST8LsXc0dTrwuG5ozwOtXInomntQ2OZ4ChkR08jkbS5xnLCVhg34TgVeWBgaEE2p8RTpigaxzKzqsGiANqM7qFVRteJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097152; c=relaxed/simple;
	bh=ujnuTbuIA+/VMzsIw8mIg7lRwtphwwsiuTKrr7QIULQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBF2LhvzvmRY+3cWLOh1N7vhTh+OJKf0D4oYtD/dCOE0GN13hICCuGjJTNQs4436Yk7aZ8Hbbfst7cEeDoRen6/B4CWHTUSaJDaV9BnxSsdP1p/pQs0MfO5yIRcl2m7CF5YJwgu48BPP+lkUk1VBvsx58GrNiOkURmIIVEp7Ysc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUE/wG40; arc=none smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c3315c5dso70277075ad.3
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 06:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781097151; x=1781701951; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQ8w1vFi6aBokKM82WvjsJebJ9j4q6ueeVSB/POf8JY=;
        b=qUE/wG40ru7ijpez3HL7ZLwhesVv1pDXuWXV4NR4Npnmb+DitMeSBXW+h4JXXLpogH
         HyVcfb0NFEYLMX+/I8LSP9IN/JMUAP0GIMG5Wykc3SfXsjREAwKw+maH97fdgBlefMZo
         rQWxr6BzoqQ9KApVUL61Ncb5CD/bkrMY1pngZk70HatIh4PgyhJ9NDRVGWp2U5tQEN22
         lKjZNI4n7/wQKsswo5rtxmgpqBWahQGGPcfUY9DmCwWziAf3LhDyMDYcNJNlpa6FTsix
         IesOBZeArFyOa4X04boQYMRYwEE8R5qD/P2mErHMT5wJ6SfXYkpDz2YqRR7NDq2HxtrK
         xtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097151; x=1781701951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQ8w1vFi6aBokKM82WvjsJebJ9j4q6ueeVSB/POf8JY=;
        b=S9aa1ZGj+Jwq5AzuhxLhGUqZPgZ9i54r0PWPw5mTXy6n+tsa8SmZiP3NyRN7qr69Qe
         jFBzM1+ifDKKGFW8kRzOl6Rpt6OVZvEQxyIRVFKzj4TB6LO32KvQM36/EiW2G3IpSgIT
         3owsNmmq0HwxK/tjQTxVr02Md1rWPstkg7Nrde+QXdjgZQ5voL2nrkrgxuJ0dq+827W9
         3p0n8egLkdOpdxmjDeuwa6+Ek8YkWzWdt0k6C9zehVp4HCaG70VLgN87Ewht7aFYaw2p
         2KSVcJKV34/1+ce1d2DgG3BeS/jtAU+fWuyxAI4k+8TUNH7ArromdhsXl877DYiGbI7u
         ZkQg==
X-Forwarded-Encrypted: i=1; AFNElJ9CgRLHBRUlG9A2TSzAn2eQ1sqXs+mgXh6vzS9LZPZaa7lW9Krk60Z7IfGKC2SmCyShnbIMHJstL38=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGW8oAmM9uvNxU5fm19Wf/gEeXU1oB16J6HIWCMpukEOewPxFS
	I1DLrjHOZqELlk638lFWovasWCCwhIp5KInECDu5vxdj1gqjo+QKlBxu
X-Gm-Gg: Acq92OFH/5u/6qDwee4+OpBXYpqnAwzPGEYffQOTNNegX/hPROppRK7aZ8yvIV+TuzA
	FU76dBz3xjC9bod5stSf6StYDaE1MA2W8ndiCUl04+R7Mx50KjCrriSvFz+09F/kmKLW3gZwyA2
	PbjVWY7nv/+BsiccSFwSZ/i7J1pU2Exd0d9K3gI1hDcaXo1QDd7HjfyjSzwneifnb9hmSZnFPWj
	SxZqP6JvDd+YXo8eyqCroW2ohP0DMBOI+vWWZ6Qi7SrC9Z8JYyqSWiVTbDJCRyis1HrvR0yYigB
	O75B4WBnQY+2s9i3p3+UCeD17+Gsn+lRtOs1g8uTzHj1spptQvxluz8Z3A4+0HPGNEGNElKdCGG
	9Txa54uG77IGDAOngeY5k/JjySspJxiWGskVg0v8xyRhMR9L6wuYMCOUEM8OlCyA/QQuGgA5JhP
	94PKWBrMSx961fu39TtE3kwxtSIVJqEoiMM7EkbqzMjsRb+KY=
X-Received: by 2002:a17:903:90c:b0:2c0:b7e1:7f08 with SMTP id d9443c01a7336-2c1e859fc13mr303390475ad.28.1781097151017;
        Wed, 10 Jun 2026 06:12:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f87920sm251348465ad.24.2026.06.10.06.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:12:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jun 2026 06:12:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/max34440): add support adpm12250
Message-ID: <3ea8d261-ccc5-4b33-8ee4-55c5e4b31670@roeck-us.net>
References: <20260610-dev-adpm12250-v1-1-422760bb80da@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610-dev-adpm12250-v1-1-422760bb80da@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91849-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alexisczezar.torreno@analog.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,analog.com:email,roeck-us.net:mid,roeck-us.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B17C669A35

On Wed, Jun 10, 2026 at 09:12:10AM +0800, Alexis Czezar Torreno wrote:
> ADPM12250 is a quarter brick DC/DC Power Module. It is a high power
> non-isolated converter capable of delivering regulated 12V with
> continuous power level of 2500W. Uses PMBus.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Reviewed-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter


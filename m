Return-Path: <linux-doc+bounces-74524-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEjuF/Bqe2mMEgIAu9opvQ
	(envelope-from <linux-doc+bounces-74524-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 15:13:04 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F03B0C55
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 15:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 173123003621
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 14:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3BC305E2E;
	Thu, 29 Jan 2026 14:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUXtNC6q"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5869625771
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769695979; cv=none; b=Y1p2fyMPz8lthANxJ0JkfhADGVQOtiqIfWEohzEJVLcZjwoI3NzDZGYa0oIL+D3WAT/tLk00C63Z73l6r/xHm//e8DnK4VJCdWryk4rdYsobo5I3bgkyS6hU2bx08opk9MxP2hYwdLevBZQz1wWZpp4X5XPgVnIqv6z9NHdzr5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769695979; c=relaxed/simple;
	bh=zcL7JK7B06/KNJU+J1fCNj0lXsVpt5cbT9t99SOxBQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fE0szTf8vG+S9H/pVXF4gAC8KYzPzUrDcDN0ODfSpObK6Yivx7CSbp3OAI6EotJCWavz5PsB51YRsdII1/2ukYzDZrcysnxa/MNPb8EJyyhv8pf6SYTJRMdo+eZ/1558uOpYosyYcdfUL2OboysZJzPrTVA+7Sn+0KUBe2HK5v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUXtNC6q; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-82307c6902eso490966b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 06:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769695978; x=1770300778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJaU3p5+sCbpbc8wHPLaxJF4pZ9l5/Cuj2w32o/JnfQ=;
        b=YUXtNC6qdd20A2pQ4SH///GADevVAsga5k3vZDvOpK4jvDHHk8LFOOgM0C0J7rc/Pk
         SDPG0PNdt7edqVpOthKeUcfBC5HrBcGEWsgtpj/oKrQKrH8O5wykYvPrcjNt9C9eaxFS
         JhAmgrsqZeVWU0Sp2jAECpt+tBcE+uyZ1cZzCrrGR4qKGvWCx1QgfUSWezehZi5CefwK
         dkE8m7dD1CK0B/u27hoDwz+dXLPM+GMgVHdsA1D+aNX4DBUaIZY0J+rsXIZjQNtspVRC
         xdqiqyWWFEFfT31x7ivlVsKR2kiUW3H0PMZ96ihPGrzeeF2adQ11oF7vzdQGjPEZuauc
         4pNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769695978; x=1770300778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yJaU3p5+sCbpbc8wHPLaxJF4pZ9l5/Cuj2w32o/JnfQ=;
        b=Ong911roxw7vI4M6AYFna6HUAK8e1BQHgFcnNLBR4LNW4LcH1gUdj1lOrlYkjuOTO5
         y8upr6jXzOR2CLrABh0C6y2xthSxkyP1e8yyBxblyLTLUokReQkXBq6gZ4aZ9FVSAcv/
         eVpGEM93R0jSk8WyF5rccmku7FwykcMjJHOA+9jA2zuyEx4+bVs/h7JZ2VuFrPK//SP5
         AlLlxAiRtXFaSTYNeXZp+XQShCeLF/kZETjMtB4Mjx/Tbq19AW5OY4i3oIFtlR8JYHlL
         BUHxiIZU9/AAuF1DMexnQvFID8Dl8aWVi3EHci3EqDDr7Gy8t4Bue2/wsFESvKWuiEUM
         porA==
X-Forwarded-Encrypted: i=1; AJvYcCWlGADjYmL4wt5NQxewN0yBggtOgL5AOkfaAnV5DoJvNzjLa0mtI4Dd7/OPiMCPaPfpQl0Ub8wXxks=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiUMdilqLm9hQY0z4QzAaGlhX0pAUN1GF1WEH2iMR85HhSljSQ
	HwjR8nnCHEpgOL+4RvS0VYIVwoHCIITcrwITMGgWTjlJ+QgrnVZdQ+Paazq2G8q5uLc=
X-Gm-Gg: AZuq6aJt7Bz7tdZ7Bo97GmeixZbPxMCh0FTRq69jEUcUYeyrMf22H1q2rlYPrkpH0jT
	tUeb6xz01WzDWH7ytka8ttSrBEUX9ojMnKgHSXZl0LD6OgHQd4yO/mcEp/HJKnrSQtj2YtNh15n
	Gpaftg1YzBJyG9sJAhjMnNeqwCya6HcH2dx6ntWcF8aQ1Fbhj4CEgf7prADLZrQ52SI7X3+F+yE
	PkhpkpT5IeqMMoeC+O+lK7tABOpzhBJrgjDDNJOwxRvycG1CcayKy4zXDtwpDkMrBKi3K7WKd8D
	fVQct5o3o2zY33662ULZ9tgW8Ceyr1C2SaLL7siTfVYuSCCO+ugwp5LnDhRdrDJCixtixSN4GeK
	xV0Obl5y/l0wtAjzfxJzqqjaxM/a7hPtXKTNAfWaOzGuvopNh3PKzIzHQpm6xBQSz1ndD4H+y5P
	BImkiYrn2RhEm56NW/XTGAIb3jUE/sKtlYZeo=
X-Received: by 2002:a05:6a21:3a83:b0:38e:99a0:105b with SMTP id adf61e73a8af0-38ec6406beamr9583107637.51.1769695977734;
        Thu, 29 Jan 2026 06:12:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642add55adsm4871419a12.32.2026.01.29.06.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 06:12:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 29 Jan 2026 06:12:54 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Charles Hsu <hsu.yungteng@gmail.com>,
	linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] hwmon: pmbus: fix table in STEF48H28 documentation
Message-ID: <82e89c98-b51b-40c1-85c9-b8e3723a3088@roeck-us.net>
References: <20260128002200.1665941-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128002200.1665941-1-rdunlap@infradead.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lwn.net,linuxfoundation.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-74524-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,roeck-us.net:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F2F03B0C55
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 04:22:00PM -0800, Randy Dunlap wrote:
> "make htmldocs" reports build errors/warnings:
> 
> Documentation/hwmon/stef48h28.rst:45: ERROR: Missing matching underline for section title overline.
> =========================================================
> in1_label               "vin".
> in1_input               Measured voltage. From READ_VIN register. [docutils]
> Documentation/hwmon/stef48h28.rst:73: WARNING: Title underline too short.
> temp2_input             Measured temperature. From READ_TEMPERATURE_2 register.
> ========================================================= [docutils]
> 
> Fix the table overline/underline line lengths and convert it to
> a 2-column table.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied.

Thanks,
Guenter


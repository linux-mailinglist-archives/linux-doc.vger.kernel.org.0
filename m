Return-Path: <linux-doc+bounces-78794-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID3/EW35sGkRpQIAu9opvQ
	(envelope-from <linux-doc+bounces-78794-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 06:11:09 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBCE25C413
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 06:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C418D30318B2
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 05:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E73532BF52;
	Wed, 11 Mar 2026 05:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKUKrTYE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8267EEC0
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 05:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773205860; cv=none; b=IQE9aGbYtu2salQaGd5QA5lNtc48vlgPSrcP6WECbjr3e8ZrjiHWEX+bqp56AIqd1seGlp+lSmq2okDOgvVAg8Y8XFSsmKG2x5H/Al4NKy+F8GtSLTzhL8A9C5AJ3hgI+lkwk6c0aIzHdCakI3nbfBrTXpf8B6E+VT1NWXtiy5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773205860; c=relaxed/simple;
	bh=OM4qA659h1ZDbIWPqTMqRO8/S3PkK0dlLyNE7bPqJZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrMlZzIAFikC0bXUOtmzd7D4TwfQiRrBaxyLE6x7nFjMYYtPL9NwEUCjc8/U3vzdQGgx69op3ZkAheFTZA/TTYGMt1tm8ihMAY3679jBjO3TjWY2Kqnh413DE1YBZL7Vax5ioUD5B8iYeMzPhIxQUAzMS0IcycxZS/AXPAqLYik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKUKrTYE; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so11050060eec.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 22:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773205857; x=1773810657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E3laUE6i6y3qJpg501FXVY7DCFbmQnP9JAUpAN9WyI0=;
        b=GKUKrTYEqjQdIPgmyYvWEYRBWj3tU/hpD3Nk0rEAO3N+gW3OagHoKuVdrN4JkqepOk
         DBhQdAV02T0TXRjG35ZwjYV/4ptxybnGDZbWFG9THQb2Q8SuRl7Z3tEsJ3AykRKi4hxJ
         q57vQZ+CQf8912pEkeoXrdb8MHSi74LXT28sshqaVshthB2wEdK3+4KIsUmHfp08PVWJ
         cavsoA5UySyUvJNiqPcFkaNgfwaBU/u4gq+oT1+cl5Ro/RQsicVoKXgu/dlj2KeuQJ/F
         oebkBMAza259swq00IPQ7gSld4YoWHguiF9YFyeZNHMbVBfCDBTIDHwJhA9FH13ew7Rh
         P2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773205857; x=1773810657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3laUE6i6y3qJpg501FXVY7DCFbmQnP9JAUpAN9WyI0=;
        b=dn0c/+N1eUUHZSYTC9SnRH5e0IECCxvL29kufPdOAhvAnbM2E5N5TQM8NDbcq2V/ym
         KmmynrMjgF66TZbTBxbDqQVbev6lyPShzbhDPMug0FqE+EX+knEvu+aqKjmA2wLbbfBa
         DSRuB6dUr+mQgc5T3YUUse96+iO8gieDqBtOVAk8AXqpSbOYm+0c6gWbjL4pFCCx6JdH
         UUIxNWqvZqGR2A1QESusaPUsEzORs1sLaQhnmQP76ksGRSBOvJtBRxbL8Xt1Rb+8hXv2
         TKdnhiu/RhnB4VbRz/+lVgj0xZUCeJc5usMWj+hiMQbEABxDAI1Hqdt+MToMN097AtfG
         yFGw==
X-Forwarded-Encrypted: i=1; AJvYcCW2WipT8mcrZYHfH11Bo6QHQqJ2rr44/1CYLDNUI6flmL9mxGN/NgHdk9vCF0IjYTLI/TOWl55euj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMGj0cQUeE0aaIyoJcbX9rVlCx/MvocfrpMYIsY9MzcX/5OwaK
	cJAdZmbYqhSNCzv06QcInt+iY6tlislviiIkp50PbygXV0IrI+X8njnE
X-Gm-Gg: ATEYQzwWaIh6gX2tGk0g5iVqmi8PJ05Hzb/yswjX2dvuDNELrgZQyM7aT1HDY5zVkvQ
	3svSEbpfgZHfxWIobkQ94fyXEuzGna1cWlpoHGGJ1+Iz0A/rkJfo6WYSnmFqmK7Yk8AaU8Hbpk/
	Gs2vWcSw6P+TfJFOXczBKUFx8kF/HRWFQ03P39TihbID3R1Nz1y/igsx1dhxMCKk64Ym+XHvTgJ
	t6uUGHVQT8yXOhWegJNnX0DcCWpnODK+ScDdwjjKcgLAE2naEUIAUBHCMyzeX46bJy+sUyLlrkp
	buHNDpq06Lve6Ra1Zk2sb4HIfKzgcTa6t9en9shtCwCOe1NxtABa8IXYyLaDfYTFJMAqXGKvCQt
	cHnFE4ePtxIhysQsRoXC+njDMJTi9o69AjstJR3bHWFawDwsZ5FDWBxTloiouKN05FmTIgSarhj
	BvC2y9UmDi7ZLiB2Q3DpyoSM63u3ow+ujII/gEnXJZ3vtO/hDh3yjeMwYoATF2skR7
X-Received: by 2002:a05:7301:2b05:b0:2ba:7b71:4f4 with SMTP id 5a478bee46e88-2be8a586373mr512287eec.32.1773205856884;
        Tue, 10 Mar 2026 22:10:56 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:6e17:9d84:ffa0:986b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8a8550d5sm1192398eec.12.2026.03.10.22.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 22:10:56 -0700 (PDT)
Date: Tue, 10 Mar 2026 22:10:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jingyuan Liang <jingyliang@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Brown <broonie@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, hbarnor@chromium.org, Jarrett Schultz <jaschultz@microsoft.com>, 
	Dmitry Antipov <dmanti@microsoft.com>
Subject: Re: [PATCH 01/12] Documentation: Correction in HID output_report
 callback description.
Message-ID: <abD5HV7TeNHtq8hi@google.com>
References: <20260303-send-upstream-v1-0-1515ba218f3d@chromium.org>
 <20260303-send-upstream-v1-1-1515ba218f3d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-send-upstream-v1-1-1515ba218f3d@chromium.org>
X-Rspamd-Queue-Id: 4EBCE25C413
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-78794-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,chromium.org:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 06:12:53AM +0000, Jingyuan Liang wrote:
> From: Jarrett Schultz <jaschultz@microsoft.com>
> 
> Originally output_report callback was described as must-be asynchronous,
> but that is not the case in some implementations, namely i2c-hid.
> Correct the documentation to say that it may be asynchronous.
> 
> Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
> ---
>  Documentation/hid/hid-transport.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/hid/hid-transport.rst b/Documentation/hid/hid-transport.rst
> index 6f1692da296c..2008cf432af1 100644
> --- a/Documentation/hid/hid-transport.rst
> +++ b/Documentation/hid/hid-transport.rst
> @@ -327,8 +327,8 @@ The available HID callbacks are:
>  
>     Send raw output report via intr channel. Used by some HID device drivers
>     which require high throughput for outgoing requests on the intr channel. This
> -   must not cause SET_REPORT calls! This must be implemented as asynchronous
> -   output report on the intr channel!
> +   must not cause SET_REPORT calls! This call might be asynchronous, so the
> +   caller should not expect an immediate response!

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry


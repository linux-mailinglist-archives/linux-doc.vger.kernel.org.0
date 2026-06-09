Return-Path: <linux-doc+bounces-91742-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RKsfE2V8KGpmFQMAu9opvQ
	(envelope-from <linux-doc+bounces-91742-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 22:49:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D7F664231
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 22:49:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=oW2U6j5O;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91742-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91742-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39CAD303DAC0
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 20:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871EE382374;
	Tue,  9 Jun 2026 20:49:38 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665BA369D51
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 20:49:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781038178; cv=none; b=f6zkTQa/0mhJiVIZd8Wo0kCuSFAaNd11PN1dfZ+S3XI/QJaIztRkyOLSFZm4tUXE3FC3TOgYQMrJcpVmr2qnQtOoWe02Pmj4mRT6tiTVatZpPJZFRTFuqVJtFcb9oSvZ0mxANaw5b+kmtvaJjDDxWLPLfNlfWHyAC6dZiM+kCb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781038178; c=relaxed/simple;
	bh=C7Tdahsero8RIs0zIirpqMGINCiA9rl3mcNltjRVAVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwRxlWXLygnndSJCrOrwA6rzuftd64acOfqZZGMOF+1iy427cuNeSnx4ZtOWBNk5vhzRLlnrEXSlREQ2BrZw4I1sY3ndWfKreGcZOQdsLIqP/HTISxbMA50edtVoLlLVNxGnj2WlcnWc/1P9vOYtTiFguC+RnX7W6vYu0gYsrCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oW2U6j5O; arc=none smtp.client-ip=209.85.210.173
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8422f395a4aso3791583b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 13:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781038177; x=1781642977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNaSbbKc3kV/mFOGFU5J1gAuNTvmvZQI05v3tB2CJWg=;
        b=oW2U6j5Oe0Bbw4RzlDyHU7oL6K+vAdyueSUsxSjkXwciDReTt4YyNTKxXywHKvTCN5
         675TlWwG3qiQEtysquAsYZLvHrCbcvPklHGAVFhe24eOnpEEg80qSJKqgM1cDLFRqGdv
         UWXW583VqTOnOTn9JQyPz6prmL2O0B94z3ezNaMafaF+3YlsTrvdr6l64jMwZeBrFwFT
         BiLiEx0IZA/z3T1HHVQ3ui8EjAxN03JJUWKN7mW6/KFo8wPKBEcTq4948W8K7ptWkZw3
         yNJJl9pz7ThAh7VJ1XioYl9Q0wZuHyzwxrxXHEBCN+hS2YHB11Y5wkaK7aQjNbHSvsXx
         hxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781038177; x=1781642977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PNaSbbKc3kV/mFOGFU5J1gAuNTvmvZQI05v3tB2CJWg=;
        b=oPuP+CX6ILJpHHliObO2LSorbm1zhM5/+JzNRcqTxJ0QQnOmROMs1oiKSzaAc41S2y
         8BuJNl3aFVaWi/91w39qqGo1AEOwEST3DmFo9AmPVmdSvexE2gtP77pl0v8tZQmfzki3
         vay2stR1bk+JEdn7v7429oLUeScXL7bbh836zHQ87jCXoVnybTia6thNNGn226Fir0xL
         J9xJL144i6RGKmkqIks0i3YHuas39jlmVkhHfDOu3ClMj9p+GV7JtjFuU/DRM84DOJte
         X1ZCy6qqz6t3Evzr/zw6XWf46n7p9mh1MC329cIjo09JtnJV3IXFKvzXKu3c1RPrObKR
         SOsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bJxYXAPgbBpvga8qqzTtlMc+avuWaycbRL2CR+plO1Uu5oU9n5SL1w0De7qvaN18TbV4YI7a3bg4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/umPdANXvW63g74PiRAdjHSCnsjDzky2la6Ugq3sta7/Ei3FB
	Scjt7fOsf7mfFXg+03rZOC5FGINOeKpPt+AbSPKMtMUWHEvBe/kw7cJQ
X-Gm-Gg: Acq92OEH61LZths1D4Jrqal48zUYgGWsEUiUYC0sGezmVIT0enT/ENCRI6SPapfg7ld
	RCEGtCkdYJIgW612JMkRAfi7fx082yFpfR0j1rg7tS5sqAazpflcdgxwT/VTjvFAnyHGLpzwtcH
	fHMeS/yRskHGKLk4s8mSU3iojfHqjoTkuDKuONiPmhhLXfylEZVHU6fZCl+Qk2zn74i5gTk5Mzk
	hQjJWYGzTrFpVKFpNnOXG27AKyqugOdclxWM7e2BWlAKfaI966sbKSv/gNWffhp+zbqjvSrhQUh
	HcNLh3E38ZcRuuj6J6mY1GFoIWDzvzI5T1y0/qEC1ve+m7CMsYptNiFrskmPHIejcyBQCyEGlMM
	v080Su4eyofG8Q8Dm3dAhqqle1mDMoITguBgjN8Ioy7mQgDMy6QNq7CCaird4cuPOwzbDEb3QXd
	/41lJwefs3Y//aT/ZW8N7a4q9pGgCn1si/ctENhY61QWnOt34=
X-Received: by 2002:a05:6a00:4f81:b0:835:3861:812c with SMTP id d2e1a72fcca58-842b67b0a55mr16936350b3a.23.1781038176594;
        Tue, 09 Jun 2026 13:49:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282915fe8sm22543272b3a.54.2026.06.09.13.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:49:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 13:49:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	richard.leitner@linux.dev
Subject: Re: [PATCH v3 3/3] hwmon: ina238: add update_interval_us attribute
Message-ID: <4ba162f3-5204-4f93-830b-0423a833f5cc@roeck-us.net>
References: <20260609-hwmon-ina238-update-interval-us-v2-v3-0-016b55567950@advastore.com>
 <20260609-hwmon-ina238-update-interval-us-v2-v3-3-016b55567950@advastore.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-hwmon-ina238-update-interval-us-v2-v3-3-016b55567950@advastore.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-91742-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ferdinand.schwenk@advastore.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:richard.leitner@linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,advastore.com:email,vger.kernel.org:from_smtp,roeck-us.net:mid,roeck-us.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83D7F664231

On Tue, Jun 09, 2026 at 09:43:12PM +0200, Ferdinand Schwenk wrote:
> From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
> 
> The INA238 family supports eight conversion time steps from 50 us to
> 4120 us (SQ52206: 66 us to 8230 us). At the millisecond granularity of
> update_interval, the four shortest steps (50, 84, 150, 280 us) all
> round to the same value and cannot be individually selected.
> 
> Add support for the generic update_interval_us attribute, which reports
> and programs the same ADC cycle time as update_interval but in
> microseconds, giving userspace full access to all conversion time steps.
> 
> Both attributes reflect the total cycle time including the active
> averaging count: the reported value is the raw conversion time
> multiplied by the number of averaged samples, and writes apply the
> inverse mapping.
> 
> Signed-off-by: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>

Applied.

Thanks,
Guenter


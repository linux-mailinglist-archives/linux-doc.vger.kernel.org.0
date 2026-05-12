Return-Path: <linux-doc+bounces-87181-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOjLNrVdA2qE5QEAu9opvQ
	(envelope-from <linux-doc+bounces-87181-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 19:04:53 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB75525634
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 19:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E4883019E73
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 17:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7322D3D7A1C;
	Tue, 12 May 2026 17:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k50ouChZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DF53D5C05
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 17:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605352; cv=none; b=vBd4BjSA3DaOurHUJAq0PGGjH/KetpNmTSpoK8YVthYpvk3YONQegJOmRyd0Z8OVLuZHmJ61og5O+gHLyIEFZKIo0UGpZeKt2CpiTw+PmuAzdgSfFnEQOWmG7on8rld1+uRsszDrJxlwNHtDeWHAOLM0E/ZiwtAaiA5ibcICK+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605352; c=relaxed/simple;
	bh=6zAnmJplbRJHrEYL7JhzTrhZXo7V5OFYFINtTtoTZ2w=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhxEWwlz2QGXcIcdsnsp4qS09p+AARbPgBoTjB72oYHkVhfMq39JqmfaME9shrZ2LHRy7A/kd3AMRn13pLlNCTihFxdt+/H5IXREiUr2bOwCM+04Epj6x0275V1qvDvVhcuv4l31ZHidClc5By4A9yROHc8FYPfSEpIH2RwFkhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k50ouChZ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so5887568e87.3
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 10:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778605349; x=1779210149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9km9X8WvuELTJi7qj+7+Noq5bB5jqawSJ9nshPfD98o=;
        b=k50ouChZSvxTZed6wqPYwc0Tt64X94W0HloH1IwzsbXRbaZCLuun2KmzIg1sMwBH+O
         QYgElNqdnQouiay3CWhPpChyGxdJQ5JfwbVOFV+vqwQ9duakW6TAf63q8lF3zQHj7Jrj
         LCkDjfzxZw4P4V3fygTPDuDbMci2mo8aaK3wCL9UWBamPbyx0P/AVlxrNYHY5DYTcJAK
         PfQe/NpnaEQD2OodCfFryrOcCMcjR/P5zgFAUlMY+mSh5Sb9LQhDNQMuXFgkA5oLWGrk
         dhCZZ1xUKwiJsJ1flAuLYZICQhaicQINrXFCgxPpCWRS02XhzA0UgyonX/vJrNFqVMvC
         CPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778605349; x=1779210149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9km9X8WvuELTJi7qj+7+Noq5bB5jqawSJ9nshPfD98o=;
        b=hki+bDeRjlUU74kLl2VfEtoYmqw+4PKKLmMI6Xdt6ZLhPFjwdkJzVpDe0AN8HJD/iC
         m+jPoueuhEnRDfhAK46e/50Vd2CoWWTaStZ38qFAL/I/pFGIuZEve0huSJX8eBAD9J/R
         L/Mm7YIylxuP1DmXWx+L3WVwfduKQoeifJayJRxm2fxlmZxZYQ8ZjBhDS/cNumSeQAj0
         Z7RiPj66E2lkxTll28/g/GStPPTqaprzZ91pns9vLKLyMDlQtDpfYhG1oTpIAI+FODZB
         XCD+Sdsqygc1jpW9f4Yj3eGbO8i2auko7RNMePsdaPl3Lmlr/8P3YaFtOxrocS07IvWI
         Z6jw==
X-Forwarded-Encrypted: i=1; AFNElJ/hh3lsHR/wjg8QXPdI0lgTlf5O6LLiQRkpM8KQBFoXYEcMCsLqPPVW4NrI/bDBKPsiEGge6nd50uw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeiYFTGfsH9fLmnmEDl5jBBFIV+F8mKMp6G1RoQpIe54n/PHQX
	1mjiC+VUXFTb3YW3WUaEal8pNDFtRK9YvqY4jUVLvpCyuvTZ6sjf8KeB
X-Gm-Gg: Acq92OEOgyu6S9kDMH6VvGnuzjIrf6ptStk+dzgFz/2vuiThGJDBvyDHiNwooyhAQWj
	DXnGUYoNFaqX83FXtn4UGjHwcGG3lG995xyxIWm1XuN/6Bf+r0M+j+2B5RrEQUdo4fLJ01dD9ZC
	WOoppOnoQ3MLl8/F2/BQUIzSNhjDfMsKrlO78PzjVyF2WvawToqTM0PFbZqPucAo0imXi6Ht/OJ
	E+LmO2qBq9QLVh3eFMRz/c60v7WPLwhF/gFExU6Pq0k77MSB21WahTgyUCNvZL7ZZyMBTFFnyq7
	M4PujMGOWzPECf0GX2jylAfbuv22SahquJKg47T6iFy2i5X9bkOoD6wWhiltzfaJh3k4N6qWquW
	rKCBL0tBb5QCB06xZgwXf5eJW0GJuEPX/+p7AYxHrQcayYuJnz6Bw7mZZUJHap1SW6n8a9MX8Wh
	/JCgyqFgt2drkW4SYbjtGBA0pv3VtwUkXVaqnGOW9c3/LaLdKR+1SKKxGrmQaXHPiUTPSmdRdEw
	BrnRwNW0n4bPXk3Ix8XV6L/BoejLo4hKR4XDYQqfihcWHeI6EN9ShvvXlAQ
X-Received: by 2002:a05:6512:31c3:b0:5a8:84a6:2e34 with SMTP id 2adb3069b0e04-5a8e30d13e6mr1353520e87.14.1778605348704;
        Tue, 12 May 2026 10:02:28 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm33071212f8f.19.2026.05.12.10.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:02:28 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Tue, 12 May 2026 18:02:22 +0100
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	rodrigo.alencar@analog.com
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v12 06/11] iio: test: iio-test-format: add test case for
 decimal format
Message-ID: <zugkmatjsacla7l7nguekmclfdkzsshr3gs434a3liccgokxb4@xg77y5tkts5c>
References: <20260510-adf41513-iio-driver-v12-0-34af2ed2779f@analog.com>
 <20260510-adf41513-iio-driver-v12-6-34af2ed2779f@analog.com>
 <agM7CT4RjzwliKmb@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agM7CT4RjzwliKmb@ashevche-desk.local>
X-Rspamd-Queue-Id: CAB75525634
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87181-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[455rodrigoalencar@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 26/05/12 05:36PM, Andy Shevchenko wrote:
> On Sun, May 10, 2026 at 01:42:24PM +0100, Rodrigo Alencar via B4 Relay wrote:
> 
> > Add iio_test_iio_format_value_decimal_64() kunit test case for decimal
> > value formatting, exploring different scales types. Also, the same
> > iio_val_s64_array_populate() macro used to populate local array is used in
> > iio_test_iio_format_value_integer_64().
> 
> ...
> 
> > +	iio_val_s64_array_populate(24, values);
> 
> You want to test this first...
> I think the previous patch needs new test cases.

This is no complex stuff.. those functions are straightforward and
goes into accordance with what the format function does... which is
the opposite, before populating the buffer. The assertion on the buffer
content accounts for that behavior.
 
-- 
Kind regards,

Rodrigo Alencar


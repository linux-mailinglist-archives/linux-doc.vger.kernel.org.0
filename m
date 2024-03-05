Return-Path: <linux-doc+bounces-11485-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BABF8726A8
	for <lists+linux-doc@lfdr.de>; Tue,  5 Mar 2024 19:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0118D1F27352
	for <lists+linux-doc@lfdr.de>; Tue,  5 Mar 2024 18:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214F218E06;
	Tue,  5 Mar 2024 18:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DVR+j9BP"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A028F7A
	for <linux-doc@vger.kernel.org>; Tue,  5 Mar 2024 18:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709663844; cv=none; b=E2bc1AQNqXtw/maujk2ldwq+cc+22RHMWsJSfDmiPKLhpLiVU/w0o8yKvMNhFNSiq1xFWf+EhavATx1FECCiYs7Q0q8dBMS8rk5WE1I1V32myuaba5E6V9+9BE7YrXirdBosJ3Yyk0d/oiXiWi5hpTxxt16Xf0VP/YaqVenlf8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709663844; c=relaxed/simple;
	bh=5fF9Zt93l1sw5LdtE5rAlykL44jfpeE2DjNHNyT8Kto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aG/21VHB3YbRqkNlYaOk/K+a7GsHwfgxzmjTiDoXoIrEAy+pHtNess5mjPfmu5MZH3XyoSPGc+0nAk3C7l8pI5MyBmu0Hy9aTi8bdnuvciBIKiMRLxLm2ZHdMwsLC2/wsectVs8+iBz8KgjIUtMTBlMxMh1f09r6/JcX418jiyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DVR+j9BP; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dd2c8f1204so7543495ad.1
        for <linux-doc@vger.kernel.org>; Tue, 05 Mar 2024 10:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709663842; x=1710268642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+a4npK3MsOrRQDl9PU2Ms+f3vwWs3ArwrgeaNqw4OUo=;
        b=DVR+j9BP6kqxSIciDH0FsuiY/lcZJrC29H1oqgyWwsU7ZUIX+OIlFFXDZcBJh7opBc
         YHiGz/o26rJyHwUqc++zJyGsqvI5eYLkGChRKgypTxjWt9KVnYGZulMJHxKkEFeY8mRe
         PGv0VXHDA50zBOXwzg09dRgFvyHDncUcIHFqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709663842; x=1710268642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+a4npK3MsOrRQDl9PU2Ms+f3vwWs3ArwrgeaNqw4OUo=;
        b=HoMlMZtasTvFe89s8NdcTQU7VSClEC9OtVsa5jUlWALuDuJJKB3CxRzDM0X73jJSBk
         3KOEyWx+jb6SfVI8OW10Dxf4X2k1/iwULuXP03QsGAqsNVYUgolcqU+EI9yw6i6kHQds
         PfqOtZcx17kb3ZhdHhSkhEOZUnOVh9ekvTKqU8ZbEWqH9C9ErH8kYJDfKQSLb9kaMwMs
         KxIOQMWSxR8aL/WJuqCDH7RJ5502K4pZoaCTUKAzVBVrHuFSVnAOg0V9AUVtgwtDXPTa
         tB7Q5YKV7ou5XRwR40ihRORlrWkexiqxIEX93e2Yc6Ir10chBBiq8bRokbt+JTra8Iil
         hNOw==
X-Forwarded-Encrypted: i=1; AJvYcCWuw19t2n7/ECjlPw1R2nvVmKFPO8fX23/CfKRv8crH7zORADRX45IEQpRAKfE3dBhZmdwi9KjWzyGCw7r6x7P75Cq3vajTSTdP
X-Gm-Message-State: AOJu0YyoKfOwx80n2DYXrqrsAMvXx45pNUKZJXyk7twfliKdsbfbKnhQ
	wdIlxNEJ9MXMeUH8v/9vZIzqY45e1ULSTA3B41r+ll9/rGGtrTffKr0pIfS1bA==
X-Google-Smtp-Source: AGHT+IHDWHoXuLIFlbxBpZaNECWt4rX2fhzwHIpZw+LJxcfzi63h9uZSaiPhb/LOSL6sAW7ZN4mKcw==
X-Received: by 2002:a17:902:da8d:b0:1db:8555:55b1 with SMTP id j13-20020a170902da8d00b001db855555b1mr3109224plx.37.1709663841973;
        Tue, 05 Mar 2024 10:37:21 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u10-20020a170903124a00b001d54b763995sm10842713plh.129.2024.03.05.10.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 10:37:21 -0800 (PST)
Date: Tue, 5 Mar 2024 10:37:20 -0800
From: Kees Cook <keescook@chromium.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Adrian Ratiu <adrian.ratiu@collabora.com>,
	linux-fsdevel@vger.kernel.org, kernel@collabora.com,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
	Doug Anderson <dianders@chromium.org>, Jann Horn <jannh@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mike Frysinger <vapier@chromium.org>
Subject: Re: [PATCH v2] proc: allow restricting /proc/pid/mem writes
Message-ID: <202403051033.9527DD75@keescook>
References: <20240301213442.198443-1-adrian.ratiu@collabora.com>
 <20240304-zugute-abtragen-d499556390b3@brauner>
 <202403040943.9545EBE5@keescook>
 <20240305-attentat-robust-b0da8137b7df@brauner>
 <202403050134.784D787337@keescook>
 <20240305-kontakt-ticken-77fc8f02be1d@brauner>
 <202403050211.86A44769@keescook>
 <20240305-brotkrumen-vorbild-9709ce924d25@brauner>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305-brotkrumen-vorbild-9709ce924d25@brauner>

On Tue, Mar 05, 2024 at 11:32:04AM +0100, Christian Brauner wrote:
> On Tue, Mar 05, 2024 at 02:12:26AM -0800, Kees Cook wrote:
> > On Tue, Mar 05, 2024 at 10:58:25AM +0100, Christian Brauner wrote:
> > > Since the write handler for /proc/<pid>/mem does raise FOLL_FORCE
> > > unconditionally it likely would implicitly. But I'm not familiar enough
> > > with FOLL_FORCE to say for sure.
> > 
> > I should phrase the question better. :) Is the supervisor writing into
> > read-only regions of the child process?
> 
> Hm... I suspect we don't. Let's take two concrete examples so you can
> tell me.
> 
> Incus intercepts the sysinfo() syscall. It prepares a struct sysinfo
> with cgroup aware values for the supervised process and then does:
> 
> unix.Pwrite(siov.memFd, &sysinfo, sizeof(struct sysinfo), seccomp_data.args[0]))
> 
> It also intercepts some bpf system calls attaching bpf programs for the
> caller. If that fails we update the log buffer for the supervised
> process:
> 
> union bpf_attr attr = {}, new_attr = {};
> 
> // read struct bpf_attr from mem_fd
> ret = pread(mem_fd, &attr, attr_len, req->data.args[1]);
> if (ret < 0)
>         return -errno;
> 
> // Do stuff with attr. Stuff fails. Update log buffer for supervised process:
> if ((new_attr.log_size) > 0 && (pwrite(mem_fd, new_attr.log_buf, new_attr.log_size, attr.log_buf) != new_attr.log_size))

This is almost certainly in writable memory (either stack or .data).

> But I'm not sure if there are other use-cases that would require this.

Maybe this option needs to be per-process (like no_new_privs), and with
a few access levels:

- as things are now
- no FOLL_FORCE unless by ptracer
- no writes unless by ptracer
- no FOLL_FORCE ever
- no writes ever
- no reads unless by ptracer
- no reads ever

Which feels more like 3 toggles: read, write, FOLL_FORCE. Each set to
"DAC", "ptracer", and "none"?

-- 
Kees Cook


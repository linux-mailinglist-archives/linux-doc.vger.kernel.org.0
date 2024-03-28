Return-Path: <linux-doc+bounces-11491-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 920168727A4
	for <lists+linux-doc@lfdr.de>; Tue,  5 Mar 2024 20:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15BCA1F275F7
	for <lists+linux-doc@lfdr.de>; Tue,  5 Mar 2024 19:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CE84DA11;
	Tue,  5 Mar 2024 19:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dRdSLyFL"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A41433AE
	for <linux-doc@vger.kernel.org>; Tue,  5 Mar 2024 19:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709667497; cv=none; b=CJYa9EcqpJguraB2j+TuguMSZV/9tAydMDiNZfVDyLP8qRa1XLzF1Kk+b4v3wAnX5Y4OZcU2U91p9gJjNkM0qBFiiB4czg0jga6pZJNVU4SgrNMUsZ5fLnJhUeHHORKfmfTQMBIAZmhlEQE4o9HsZ4J3h2BLdOwFfnYGyHtslxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709667497; c=relaxed/simple;
	bh=yjCr221DADkA5bNqdiY3x3UI306XYd+UggCeyz1yRHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5OvWFIrnmUbqjGQ/No8Uh1ToIK8YGh/xgbMmL8p3rps38uXHynFYbh05EDzTNboidT40AlQAVFdBE3TzQ4oMHTMfNB4+AEXoMs6ozAQapFY6vdHFZn32TEXRxcgH0p3hujUEZbI4fle9riAGThecblmL03vLn0XAVb6cBiuV1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dRdSLyFL; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e627596554so1902981b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 05 Mar 2024 11:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709667495; x=1710272295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HA7mlV83NfUZx2uZSPlTtkihc76ZZ9iwfT6eqOr1MbM=;
        b=dRdSLyFLWUwFE7SkDpzX3lGrbbKJCXv7b25F3N1BSaoWCN4AMTYspJp8sArHg3f5/f
         WEbQVWXoqKTUVQH5c8n+pQ+q4NY4tjOaLmXs9wCNZ+6wP/3zNegJnX6qwfjukMtDfwb1
         Qa4yKG0JnV+CBMpQeyUVWCkjnij8/Jwo/AqC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709667495; x=1710272295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HA7mlV83NfUZx2uZSPlTtkihc76ZZ9iwfT6eqOr1MbM=;
        b=nVbIV+gAZQ0QgaO/HCUeFQZf5pkTSsrGZ9Iouwn1HcV2IKMLxxrIpB2p2RPsUoXywe
         998awaLbTuI7UoOYQBGxnKhDdFpGSiazp/grID3WTMFotJMtLwkpsog8kZbmHF/DL2od
         wsJiLkJWgdO1unwU1Fzdw6bTfzGkdjG4ASmZuuK75oWizNijUHeoB0WdzXBiZsECfrb8
         qApCD4YL8IqThIMX8DAJXu0aEOkXoCDpPOS+njpyEQcFJwrxVfOoZZCkZS9wZM9Qc8Cg
         botyWcQwOT/WYaRyjvBhnohvbWvWFvEWYNXwk9VKfy3GDqbygcekCvplZXLPp+bsXdM0
         U+2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNsbtkjkJ1e+LKWVuhU7slHHtTe4x59IKSy78dxZMgmyMOpH4VDbatlOD9+Q+3C3DYt69IEP2mFNJcvVGoR7jHwA+x3DnbqTLc
X-Gm-Message-State: AOJu0YyWhaQ5+G+le1kHElvXwm8EJRVAp36uANo4NKNp4LwJgFZOIsnl
	HkS+UE2Fa/jT72INEGx/SP/Qo0cVXE4ERhn1lpNiE0rxCN09MbO/OJm+w00Q+g==
X-Google-Smtp-Source: AGHT+IHmm9bDdwsC5X6VFNK7Wqa2G5+ysPfNvANktTS1n2VdscWFowLK6SOVTNL9odXB+HtrCQCV2w==
X-Received: by 2002:a05:6a20:d04e:b0:1a1:e41:979b with SMTP id hv14-20020a056a20d04e00b001a10e41979bmr3227567pzb.41.1709667494966;
        Tue, 05 Mar 2024 11:38:14 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 11-20020a63104b000000b005d8e30897e4sm9348461pgq.69.2024.03.05.11.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 11:38:14 -0800 (PST)
Date: Tue, 5 Mar 2024 11:38:13 -0800
From: Kees Cook <keescook@chromium.org>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
	kernel@collabora.com, linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Guenter Roeck <groeck@chromium.org>,
	Doug Anderson <dianders@chromium.org>, Jann Horn <jannh@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mike Frysinger <vapier@chromium.org>
Subject: Re: [PATCH v2] proc: allow restricting /proc/pid/mem writes
Message-ID: <202403051135.708135A8@keescook>
References: <20240301213442.198443-1-adrian.ratiu@collabora.com>
 <20240304-zugute-abtragen-d499556390b3@brauner>
 <202403040943.9545EBE5@keescook>
 <20240305-attentat-robust-b0da8137b7df@brauner>
 <202403050134.784D787337@keescook>
 <20240305-kontakt-ticken-77fc8f02be1d@brauner>
 <202403050211.86A44769@keescook>
 <20240305-brotkrumen-vorbild-9709ce924d25@brauner>
 <202403051033.9527DD75@keescook>
 <45d98-65e77400-5-31aa8000@248840925>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45d98-65e77400-5-31aa8000@248840925>

On Tue, Mar 05, 2024 at 07:34:34PM +0000, Adrian Ratiu wrote:
> On Tuesday, March 05, 2024 20:37 EET, Kees Cook <keescook@chromium.org> wrote:
> 
> > On Tue, Mar 05, 2024 at 11:32:04AM +0100, Christian Brauner wrote:
> > > On Tue, Mar 05, 2024 at 02:12:26AM -0800, Kees Cook wrote:
> > > > On Tue, Mar 05, 2024 at 10:58:25AM +0100, Christian Brauner wrote:
> > > > > Since the write handler for /proc/<pid>/mem does raise FOLL_FORCE
> > > > > unconditionally it likely would implicitly. But I'm not familiar enough
> > > > > with FOLL_FORCE to say for sure.
> > > > 
> > > > I should phrase the question better. :) Is the supervisor writing into
> > > > read-only regions of the child process?
> > > 
> > > Hm... I suspect we don't. Let's take two concrete examples so you can
> > > tell me.
> > > 
> > > Incus intercepts the sysinfo() syscall. It prepares a struct sysinfo
> > > with cgroup aware values for the supervised process and then does:
> > > 
> > > unix.Pwrite(siov.memFd, &sysinfo, sizeof(struct sysinfo), seccomp_data.args[0]))
> > > 
> > > It also intercepts some bpf system calls attaching bpf programs for the
> > > caller. If that fails we update the log buffer for the supervised
> > > process:
> > > 
> > > union bpf_attr attr = {}, new_attr = {};
> > > 
> > > // read struct bpf_attr from mem_fd
> > > ret = pread(mem_fd, &attr, attr_len, req->data.args[1]);
> > > if (ret < 0)
> > >         return -errno;
> > > 
> > > // Do stuff with attr. Stuff fails. Update log buffer for supervised process:
> > > if ((new_attr.log_size) > 0 && (pwrite(mem_fd, new_attr.log_buf, new_attr.log_size, attr.log_buf) != new_attr.log_size))
> > 
> > This is almost certainly in writable memory (either stack or .data).
> 
> Mostly yes, but we can't be certain where it comes from, because
> SECCOMP_IOCTL_NOTIF_RECV passes any addresses set by the
> caller to the supervisor process.
> 
> It is a kind of "implementation defined" behavior, just like we
> can't predict what the supervisor will do with the caller mem :)
> 
> > 
> > > But I'm not sure if there are other use-cases that would require this.
> > 
> > Maybe this option needs to be per-process (like no_new_privs), and with
> > a few access levels:
> > 
> > - as things are now
> > - no FOLL_FORCE unless by ptracer
> > - no writes unless by ptracer
> > - no FOLL_FORCE ever
> > - no writes ever
> > - no reads unless by ptracer
> > - no reads ever
> > 
> > Which feels more like 3 toggles: read, write, FOLL_FORCE. Each set to
> > "DAC", "ptracer", and "none"?
> 
> I really like this approach because it provides a  mechanism
> with maximum flexibility without imposing a specific policy.
> 
> What does DAC mean in this context? My mind jumps to
> Digital to Analog Converter :)

Ah yes, sorry, this is Discretionary Access Control (which is my
short-hand for saying "basic file permissions"). But I guess that's kind
of not really true since the open() access checks are doing a
"ptrace-able" check in addition to the file perms check.

> Shall I give it a try in v3?

Yeah, though maybe see if Mike or Jann chime in over the next few days?

-Kees

-- 
Kees Cook


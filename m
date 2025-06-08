Return-Path: <linux-doc+bounces-48375-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B93DAD135B
	for <lists+linux-doc@lfdr.de>; Sun,  8 Jun 2025 18:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8104188B1A6
	for <lists+linux-doc@lfdr.de>; Sun,  8 Jun 2025 16:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4354318A92D;
	Sun,  8 Jun 2025 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="ddhvU2aR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E542746A
	for <linux-doc@vger.kernel.org>; Sun,  8 Jun 2025 16:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749400559; cv=none; b=TyX6EHqMOUu9UW5y4fBVvSujBnoIZBETAgqAdXUl7JO1i9VhT5JtF1ghJUtldMg2xqrmw5vVDobiZt2PCcaCZFIOBAG10wIdh0VKgz6X2Mxb0B3KlgcTLe80v9LIa0T0HnY4kYlOpD11WBFcO3gj/aRbqrl/4lVOUyQu1w/Jzhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749400559; c=relaxed/simple;
	bh=G+nB+5r3+idVDUDgXEpuU874M6pCPfeB02P2+ip+IMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAZNgq2oc92Mfu7eyxhhDF+cJKFHq2KAhYLtD0C7k+FwuyVVMYcQC10t6ICc3YE/UBJM+FYQOKdkbULHiBDjim5Yb68SVfydW56vbVcBVLidbVWHM1c2LtvQ48L2wba/Ce80jSkiwEZII2vC5goWbT/iZKMpUwaL32xCMEbnZew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=ddhvU2aR; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a4323fe8caso23922281cf.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Jun 2025 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749400556; x=1750005356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hn9Sb4IlvfXIFtJ8XIXM20qiAkkg1B8bbJW0HdlNMEk=;
        b=ddhvU2aR+ha86BYd16YZyDX7HjticK7TLFiDSPFe+9eqGafG0sjYGk0Nh59cGyyXHe
         mi0P9VejPhJhpbEgayneL5nnoYq/M6CVFG1HK47hQeZPfMkWwm8s3LQILGr/50PiqMN6
         v+3VwTjcEoeB6o/BgUBogcR+kb32utiteGK/XYAC4Wiz6jObMVpCMVmlZzSUbSJJJsUB
         BeT86OrrxEmev4/RtFTxArfTR3knOTQAjaQRuT6ZIqxwK0DnCCBdGc3M4rPv2X47g8v2
         y9WGPAAfwTlOCBkPIlsS1jdzUXZK+mGMSCtgaGQ5PKkZO1rI61bnMlHlUwW9uuLS1f1v
         Ao3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749400556; x=1750005356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hn9Sb4IlvfXIFtJ8XIXM20qiAkkg1B8bbJW0HdlNMEk=;
        b=V+cNZptZ8enxJZ3CBLlP+Ix8yJx5mR8hRsbpCK2x/NIPLQUmYHmJ/yPZ3D/+oesVGd
         /RoWdK4DXpuIntsvqOHEwyrEBPVWA84ylQuVODhbtEnzjjRO6yBe1Oj6XvUO7uE4Rmn6
         FmV0XUO92qKfOHt70w0R6RPshs8Pj46o56RuS14MWqbdzd12YJOG4tfB8xG4YYVtOyE4
         T4IwMNsKnXjacJx2dH9/1a77D4kOLUv1yq+/yAz6WueVRyLVMvtEwGCzkrYlF3rNB+68
         aJraLMu17blXbsZsyCEmiSsyoJR7n0miohTCoRjzDVkM0LYBXEEjwxlX1xL0ewm9KZgz
         DXwA==
X-Forwarded-Encrypted: i=1; AJvYcCVSUrfgoVRONWPbhVhy5/n36jRCKcVRkYgmeNfGRU3QiN+Yy4xFdVS9+Fprjy2UQ+EMZl/1w3T85b4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfl1ank+s6Mkb5yi8nahVe0If0pv7aWW3wkdOiC+gTDnk/X4JI
	/96ApdBBc0ifs4Kw1q6F5LKn8PGgSHD5jXF3jf/kCdS9DXefgKH+sFKiVK6+5vlAVRGc8ZXnGvz
	NTh/IpsfYTz4kFLVZjJUL7hSjWPma1/xfENWef89pSw==
X-Gm-Gg: ASbGncsuYtSc1Y5ngMVSPpvyvOPSfBWugInJPXyr5O79AN2yf5bvDG6FXSivJer1bHG
	Lt29ETrJqLOHpfd7FJsi/7C3u+3Yfv4k+7ehPjE2OIVHxqReaqqnlWDeGg96A8qTIXwdKcbnMAA
	ycm21ykm+oDe//WmnFTC9DdZVeGR/FBjbzQq14lIM0
X-Google-Smtp-Source: AGHT+IFqe9ejTPlAsTaPj7L7N+1gJedHDl31WYCkzxJQefBFZZ1c4isRvgInmAri9CFv7dkQjmquxrP4qLVUvalWYQ4=
X-Received: by 2002:a05:622a:590c:b0:4a4:34ed:b64c with SMTP id
 d75a77b69052e-4a5b9dab813mr183961441cf.45.1749400556526; Sun, 08 Jun 2025
 09:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-11-pasha.tatashin@soleen.com> <mafs0tt4urwp0.fsf@kernel.org>
In-Reply-To: <mafs0tt4urwp0.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 8 Jun 2025 12:35:19 -0400
X-Gm-Features: AX0GCFteXcRxC3-vZZL_aqHL2ebAE0Lr6ln_w6d3VAVqndZjIpLQe59BlkOtgJc
Message-ID: <CA+CK2bDx6DAKvW5jDajDkTzzsaR9fLWS6EFSDHCq893hOCW_7Q@mail.gmail.com>
Subject: Re: [RFC v2 10/16] luo: luo_ioctl: add ioctl interface
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, changyuanl@google.com, 
	rppt@kernel.org, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 12:16=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Thu, May 15 2025, Pasha Tatashin wrote:
>
> > Introduce the user-space interface for the Live Update Orchestrator
> > via ioctl commands, enabling external control over the live update
> > process and management of preserved resources.
> >
> > Create a misc character device at /dev/liveupdate. Access
> > to this device requires the CAP_SYS_ADMIN capability.
> >
> > A new UAPI header, <uapi/linux/liveupdate.h>, defines the necessary
> > structures. The magic number is registered in
> > Documentation/userspace-api/ioctl/ioctl-number.rst.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> [...]
> > +static int luo_ioctl_fd_preserve(struct liveupdate_fd *luo_fd)
> > +{
> > +     struct file *file;
> > +     int ret;
> > +
> > +     file =3D fget(luo_fd->fd);
> > +     if (!file) {
> > +             pr_err("Bad file descriptor\n");
> > +             return -EBADF;
> > +     }
> > +
> > +     ret =3D luo_register_file(&luo_fd->token, file);
> > +     if (ret)
> > +             fput(file);
> > +
> > +     return ret;
> > +}
> > +
> > +static int luo_ioctl_fd_unpreserve(u64 token)
> > +{
>
> This leaks the refcount on the file that preserve took. Perhaps
> luo_unregister_file() should return the file it unregistered, so this
> can do fput(file)?

Thank you, David Matlack also noticed this leak, I fixed it.

>
> > +     return luo_unregister_file(token);
> > +}
> > +
> > +static int luo_ioctl_fd_restore(struct liveupdate_fd *luo_fd)
> > +{
> > +     struct file *file;
> > +     int ret;
> > +     int fd;
> > +
> > +     fd =3D get_unused_fd_flags(O_CLOEXEC);
> > +     if (fd < 0) {
> > +             pr_err("Failed to allocate new fd: %d\n", fd);
> > +             return fd;
> > +     }
> > +
> > +     ret =3D luo_retrieve_file(luo_fd->token, &file);
> > +     if (ret < 0) {
> > +             put_unused_fd(fd);
> > +
> > +             return ret;
> > +     }
> > +
> > +     fd_install(fd, file);
> > +     luo_fd->fd =3D fd;
> > +
> > +     return 0;
> > +}
> > +
> > +static int luo_open(struct inode *inodep, struct file *filep)
> > +{
> > +     if (!capable(CAP_SYS_ADMIN))
> > +             return -EACCES;
> > +
> > +     if (filep->f_flags & O_EXCL)
> > +             return -EINVAL;
> > +
> > +     return 0;
> > +}
> > +
> > +static long luo_ioctl(struct file *filep, unsigned int cmd, unsigned l=
ong arg)
> > +{
> > +     void __user *argp =3D (void __user *)arg;
> > +     struct liveupdate_fd luo_fd;
> > +     enum liveupdate_state state;
> > +     int ret =3D 0;
> > +     u64 token;
> > +
> > +     if (_IOC_TYPE(cmd) !=3D LIVEUPDATE_IOCTL_TYPE)
> > +             return -ENOTTY;
> > +
> > +     switch (cmd) {
> > +     case LIVEUPDATE_IOCTL_GET_STATE:
> > +             state =3D READ_ONCE(luo_state);
> > +             if (copy_to_user(argp, &state, sizeof(luo_state)))
> > +                     ret =3D -EFAULT;
> > +             break;
> > +
> > +     case LIVEUPDATE_IOCTL_EVENT_PREPARE:
> > +             ret =3D luo_prepare();
> > +             break;
> > +
> > +     case LIVEUPDATE_IOCTL_EVENT_FREEZE:
> > +             ret =3D luo_freeze();
> > +             break;
> > +
> > +     case LIVEUPDATE_IOCTL_EVENT_FINISH:
> > +             ret =3D luo_finish();
> > +             break;
> > +
> > +     case LIVEUPDATE_IOCTL_EVENT_CANCEL:
> > +             ret =3D luo_cancel();
> > +             break;
> > +
> > +     case LIVEUPDATE_IOCTL_FD_PRESERVE:
> > +             if (copy_from_user(&luo_fd, argp, sizeof(luo_fd))) {
> > +                     ret =3D -EFAULT;
> > +                     break;
> > +             }
> > +
> > +             ret =3D luo_ioctl_fd_preserve(&luo_fd);
> > +             if (!ret && copy_to_user(argp, &luo_fd, sizeof(luo_fd)))
> > +                     ret =3D -EFAULT;
>
> luo_unregister_file() is needed here on error.
>

Done, thank you.

Pasha


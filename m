Return-Path: <linux-doc+bounces-61504-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D42B938E0
	for <lists+linux-doc@lfdr.de>; Tue, 23 Sep 2025 01:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABB062A812F
	for <lists+linux-doc@lfdr.de>; Mon, 22 Sep 2025 23:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8772F0C6C;
	Mon, 22 Sep 2025 23:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="K8wuFhmK"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACA7267B00
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 23:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758583092; cv=none; b=oVLDIS5CX7Xcpp19bAlX2Pf9YRv7Ze+ttv1diGekcd9yN+ssZxjoPCG1/9EnoeZU8h8/LUZAhhmYdE7b3ijAWcuJLlJ7D4K2Cn+PJDdzSZkhhvYld8kLkUYylydR39iMB8MtOv3fuCQ+7eyjMyaYKYLnxTrKp/8HoA1klKdxjvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758583092; c=relaxed/simple;
	bh=xCV6ojMbzc6eJsEK8QI8aRXOvwRakeEpGB5Uw4nXNXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLop88CdgeQ1j+ufs9x4xKROT6/ToevzvbzMgnFv+9jNvQKfAx6DWUyM5JK/58xhcuCVdh1AgCyGylzQ7/VQAmUKPzztyz/Dg9x2/gGmafrjhYKSw1sIRBXdJo5Rui7WO6/JKbuFmWPclVgjpZAIHpSjWB0oWwdL5xLdoFzrtuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=K8wuFhmK; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4c7de9cc647so21217251cf.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 16:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1758583088; x=1759187888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMhzCZwWvSzmvpHLTjoUKn9VxrN7Ynwi1w+l4sf5xFg=;
        b=K8wuFhmK1Pm0t4+LoNc6LEVgF0GhPhqaWXNTpmVn4VMSM/Oq40GpqWenZKOi3pHO6z
         Yhlk8y3diE0WpjFrmsmnfgrsPRUgxjP1I3t+3mZRxtFyN1FQXzQLTDA8ZiB3kiZp/NjU
         ykTVDZ7wasx6veB3oN30mtOZTqXjSMEp5mipa88xkBYCt7y/NhmqnDSJkDMTGdGA8B/S
         tIXofJSmY8zC3htL4XAgfhGjPe2Dqf2RBfDJZaXo0y5gmJiEXKOffZjig/OClPd86IiM
         TQCFOd17GHWPdFHTH2kBQYtYLvT5RMFwNviZ99jRvUgucbImIzK4Ytbp1pFFynsZLlOl
         7fRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758583088; x=1759187888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMhzCZwWvSzmvpHLTjoUKn9VxrN7Ynwi1w+l4sf5xFg=;
        b=S0/ITGYGIgq0tr6TsnW24fUb8X724H5o7kMCRaHPRgb5kGNjN/M+a6dfJvgyRO/nLS
         6HGScFzLZk0hxXvFJm+4LR8fI+ouZhC/vYS6sae1KZlN2Y2PtClLIrE2BO9BxeM56JBa
         qozyLVPIWvhWPh+8jIcQUOWPpCwD9Qd7oetivOnKnX/dmG594tfQKUbwR9rt6kGWxW2Y
         br+j6+EGqxBi9MT76VuitQwTgox/fmWOtZ/9w8dgZ+Y8CzBp2we9+MxvMpnHmZ0HgTgN
         uSiWkkZZ6YnYgDehbul9QLujCGYM4W9klZMU/A/UoK8RPwo4UVn/LP4v4898j6FqfRJe
         fSug==
X-Forwarded-Encrypted: i=1; AJvYcCXQfFr0ug66ZOAGNMdNtBmVK7ITGREpXP5oYabfSgY/K8zFhkbXPm+S1VIhgMamcElGKkzZKWmHuiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaiZESeiC/fWJ8xvOKausi3vlFRhdGk5AwQczFGUCv1Q4RAKRc
	V+GBJMdMeOax/qrWdOzrAZ0MYimwtHThQ5dBUCWLAfy5Hzrd1omjSpPR35QxhHxDZZMu7KPHmUk
	PjgOeRUVnle+GihhBfv6h800JhiECUKI+KzU+BBx7xQ==
X-Gm-Gg: ASbGncsHGS2bS2OBInNsFTMJRtVIsaDxqP07NLWGhmXqfjx8sSbRyub3uNFJ6Yr8PlG
	g4Rhc0HUTbmcnfmp54NmXujTePHHr/9m/cH6MrU4va/eyj2hWKEpXGTgw5rOVN5I1gC9vLofCzR
	VDq5f4uz5EEz7vxuIYJXTBz6wDw0DyWDtleq+TLA5/PQiMvhGQ0PC+sun9kxOlhMSxS0Ejlk6lL
	xr8
X-Google-Smtp-Source: AGHT+IHI7fhTCub3gR6FvbuAadFoUObXh5vH4jQwaxG/DrUU33qN/BcWlCQrH5/hzcu886DWWuHj5rfrmRYYSjZ03hs=
X-Received: by 2002:a05:622a:130b:b0:4b3:140c:ef9f with SMTP id
 d75a77b69052e-4d369eae636mr9141131cf.23.1758583088357; Mon, 22 Sep 2025
 16:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <20250807014442.3829950-19-pasha.tatashin@soleen.com> <20250814140252.GF802098@nvidia.com>
In-Reply-To: <20250814140252.GF802098@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 22 Sep 2025 19:17:31 -0400
X-Gm-Features: AS18NWAv4dGFYOhiSllCg2EpqurnWbzUBhfung7Dsp39jZsN7-oM6V2Ui5LlSZc
Message-ID: <CA+CK2bB+NRneE=uFxvQ867zT3BHGvfBUz+6Ntqk9p2=wj4JYWQ@mail.gmail.com>
Subject: Re: [PATCH v3 18/30] liveupdate: luo_files: luo_ioctl: Add ioctls for
 per-file state management
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 10:02=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> w=
rote:
>
> On Thu, Aug 07, 2025 at 01:44:24AM +0000, Pasha Tatashin wrote:
> > +struct liveupdate_ioctl_get_fd_state {
> > +     __u32           size;
> > +     __u8            incoming;
> > +     __aligned_u64   token;
> > +     __u32           state;
> > +};
>
> Same remark about explicit padding and checking padding for 0

Done

> > + * luo_file_get_state - Get the preservation state of a specific file.
> > + * @token: The token of the file to query.
> > + * @statep: Output pointer to store the file's current live update sta=
te.
> > + * @incoming: If true, query the state of a restored file from the inc=
oming
> > + *            (previous kernel's) set. If false, query a file being pr=
epared
> > + *            for preservation in the current set.
> > + *
> > + * Finds the file associated with the given @token in either the incom=
ing
> > + * or outgoing tracking arrays and returns its current LUO state
> > + * (NORMAL, PREPARED, FROZEN, UPDATED).
> > + *
> > + * Return: 0 on success, -ENOENT if the token is not found.
> > + */
> > +int luo_file_get_state(u64 token, enum liveupdate_state *statep, bool =
incoming)
> > +{
> > +     struct luo_file *luo_file;
> > +     struct xarray *target_xa;
> > +     int ret =3D 0;
> > +
> > +     luo_state_read_enter();
>
> Less globals, at this point everything should be within memory
> attached to the file descriptor and not in globals. Doing this will
> promote good maintainable structure and not a spaghetti
>
> Also I think a BKL design is not a good idea for new code. We've had
> so many bad experiences with this pattern promoting uncontrolled
> incomprehensible locking.
>
> The xarray already has a lock, why not have reasonable locking inside
> the luo_file? Probably just a refcount?
>
> > +     target_xa =3D incoming ? &luo_files_xa_in : &luo_files_xa_out;
> > +     luo_file =3D xa_load(target_xa, token);
> > +
> > +     if (!luo_file) {
> > +             ret =3D -ENOENT;
> > +             goto out_unlock;
> > +     }
> > +
> > +     scoped_guard(mutex, &luo_file->mutex)
> > +             *statep =3D luo_file->state;
> > +
> > +out_unlock:
> > +     luo_state_read_exit();
>
> If we are using cleanup.h then use it for this too..
>
> But it seems kind of weird, why not just
>
> xa_lock()
> xa_load()
> *statep =3D READ_ONCE(luo_file->state);
> xa_unlock()
>
> ?

Yes, we can simplify with xa_lock(), thank you for your suggestion.

>
> > +static int luo_ioctl_set_fd_event(struct luo_ucmd *ucmd)
> > +{
> > +     struct liveupdate_ioctl_set_fd_event *argp =3D ucmd->cmd;
> > +     int ret;
> > +
> > +     switch (argp->event) {
> > +     case LIVEUPDATE_PREPARE:
> > +             ret =3D luo_file_prepare(argp->token);
> > +             break;
> > +     case LIVEUPDATE_FREEZE:
> > +             ret =3D luo_file_freeze(argp->token);
> > +             break;
> > +     case LIVEUPDATE_FINISH:
> > +             ret =3D luo_file_finish(argp->token);
> > +             break;
> > +     case LIVEUPDATE_CANCEL:
> > +             ret =3D luo_file_cancel(argp->token);
> > +             break;
>
> The token should be converted to a file here instead of duplicated in
> each function

struct luo_file is preivate to luo_file.c, and I think it makes sense
to keep it that way, amount of duplicated code is trivial.00

> >  static int luo_open(struct inode *inodep, struct file *filep)
> >  {
> >       if (atomic_cmpxchg(&luo_device_in_use, 0, 1))
> > @@ -149,6 +191,8 @@ union ucmd_buffer {
> >       struct liveupdate_ioctl_fd_restore      restore;
> >       struct liveupdate_ioctl_get_state       state;
> >       struct liveupdate_ioctl_set_event       event;
> > +     struct liveupdate_ioctl_get_fd_state    fd_state;
> > +     struct liveupdate_ioctl_set_fd_event    fd_event;
> >  };
> >
> >  struct luo_ioctl_op {
> > @@ -179,6 +223,10 @@ static const struct luo_ioctl_op luo_ioctl_ops[] =
=3D {
> >                struct liveupdate_ioctl_get_state, state),
> >       IOCTL_OP(LIVEUPDATE_IOCTL_SET_EVENT, luo_ioctl_set_event,
> >                struct liveupdate_ioctl_set_event, event),
> > +     IOCTL_OP(LIVEUPDATE_IOCTL_GET_FD_STATE, luo_ioctl_get_fd_state,
> > +              struct liveupdate_ioctl_get_fd_state, token),
> > +     IOCTL_OP(LIVEUPDATE_IOCTL_SET_FD_EVENT, luo_ioctl_set_fd_event,
> > +              struct liveupdate_ioctl_set_fd_event, token),
> >  };
>
> Keep sorted

Done


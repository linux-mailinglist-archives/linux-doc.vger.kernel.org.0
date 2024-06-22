Return-Path: <linux-doc+bounces-19196-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A199130F3
	for <lists+linux-doc@lfdr.de>; Sat, 22 Jun 2024 01:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B6B41F22B35
	for <lists+linux-doc@lfdr.de>; Fri, 21 Jun 2024 23:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B44D16EC13;
	Fri, 21 Jun 2024 23:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WJYmpbzy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECF016EB76
	for <linux-doc@vger.kernel.org>; Fri, 21 Jun 2024 23:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719014039; cv=none; b=OlCBNvTGXkLMnqrU6uM+ghDSWsKCSs1p6gAWR2eQkfIvPkV4QvJ4RnC6WyOJlGcPd4ncMeAKu8tDn5UjVk3yEQqiNh/SwKADSfVKzB87wAUPggds8y66u00+PdNy60f0hxy3U5vOE7oQwFsIkiS4gEEHy2v+ZtMSnZvzj33Fnwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719014039; c=relaxed/simple;
	bh=Wv9IJwfLBg9/0U/JTkEwyP7N8Hf4US/FVyAw3Wa/a8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rBsHSjZZPlb/3Phm8m8Sxfi6IKZy87h5+06CaBvLPLb759wm/F6AiOlpEXysCak1/1QSROmiiZSkOkzUFlULmR22zxJGNIKXqIYjI4S+YzDOUqaa9jGMCVapRWF6C6SbeQXkL42wvw9eu+UySO6umyiszlgcQtgNo2FmSLw1PaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WJYmpbzy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42189d3c7efso29220495e9.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Jun 2024 16:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719014036; x=1719618836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6xesaMacZace3FQ+zqQcgYnav9DuFBRmm+vK92q3yQ=;
        b=WJYmpbzy4IRekytBtjX3ihMxhT3jZar4sCQ0kEOmlPxeGbCyMRHc7++B2AGXeJPnBh
         mRH1JOBblasOf+kAdeR9qIoFX/nei2iE15r/kHvfrh7Z6cJhUui5xEkXUQZ8bBDj2NwL
         98klbN3clmkT2SP7jLS7h/u1YsgmNz0bRXsCht6XMmjbgRL9djK1PWNtmB5yoq5iN1ys
         wdF88PdxCP6v4WkudH7WMKIlhu6M8W3WImCUBe/EIt6hQ+lyp4q6StXUM0cn+RvPBSxW
         WPuwy5x20U3nvAdDOBKjcWk5mjQRQ6dl9p5hGlX0bO6wDR6lbEKDcLPotdBRgEHOMy3i
         kx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719014036; x=1719618836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6xesaMacZace3FQ+zqQcgYnav9DuFBRmm+vK92q3yQ=;
        b=vp8DwjL3wGps2R98WUp2QC+vBFwAjG9NSZ053gmo7iirbZa+xvrJZa/Zlzks3ZWJ3h
         jWdkFge9R7n3vf8KyE4uUjG7wAF5UmEILfXxjYHdoVYNyJoOxLLTXK/Fo67r04TTl3Xj
         aftaEfjNPQTJS5N3MfmG3PVjbJDdwHn1Ww9ZA2zr9FvVOPgUkRX4kcIhKFZRET4D+cXB
         jTKhibs+y8hHJbB282Q0/hhF5IxUOWFiNyW2WV3LnpQYwRoMxiF7ldg1nJKPFb+8m10U
         0azgq5UUfREhIl1+bhE3XsA4V088juCHOn+HykWlwYGxFu1SE21ij+x4Pob2gVUMCrx7
         VcTA==
X-Forwarded-Encrypted: i=1; AJvYcCWFUrDe8habKYXxy4AqYNIjFxjnaDrEzKOcuJWFjDugEhlICzZ1iJKwS9aNqFLthuU5+/ZNWwQRBZCt4nix8Pw40sbpPsQfM9xQ
X-Gm-Message-State: AOJu0YyKZs11r97igwiTdWutZHxIL2VZsS5FXiZGdiFEeCHFA/18EL7F
	wfFg1yc1aoUGN4fFT+0CRBLmbhFwrYAFjFc97t8uv51ALmazj1uaBO4aQGCRBPUAJqkQebq7Z2d
	eNLLg4wlAu7sV8EAuzgvJDhYeJiihzIZcF49Y
X-Google-Smtp-Source: AGHT+IEbWjWelzpZFY63Cou53ZgSpdbbIsCKPdXNcVkLJoDwJ5in2IsqHIXIjhgjpWdIZEdefuzVToe3fpWD1sP9vtQ=
X-Received: by 2002:a05:600c:4f4e:b0:424:80c8:dc08 with SMTP id
 5b1f17b1804b1-42480c8dda6mr38434615e9.12.1719014035702; Fri, 21 Jun 2024
 16:53:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620184856.600717-1-jiaqiyan@google.com> <87msnfusyw.fsf@linux.intel.com>
In-Reply-To: <87msnfusyw.fsf@linux.intel.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Fri, 21 Jun 2024 16:53:41 -0700
Message-ID: <CACw3F51QadqESg2a8Lb_A+PCH7TH0W8BqwNKCyOX4nyeeP1wAw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Userspace controls soft-offline pages
To: Andi Kleen <ak@linux.intel.com>
Cc: nao.horiguchi@gmail.com, linmiaohe@huawei.com, jane.chu@oracle.com, 
	osalvador@suse.de, muchun.song@linux.dev, akpm@linux-foundation.org, 
	shuah@kernel.org, corbet@lwn.net, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your comment, Andi.

On Thu, Jun 20, 2024 at 3:53=E2=80=AFPM Andi Kleen <ak@linux.intel.com> wro=
te:
>
> Jiaqi Yan <jiaqiyan@google.com> writes:
>
> > Correctable memory errors are very common on servers with large
> > amount of memory, and are corrected by ECC, but with two
> > pain points to users:
> > 1. Correction usually happens on the fly and adds latency overhead
> > 2. Not-fully-proved theory states excessive correctable memory
> >    errors can develop into uncorrectable memory error.
>
> This patchkit is amusing (or maybe sad) because it basically tries to
> reconstruct the original soft offline design using a user space daemon
> instead of doing policy badly in the kernel.

Some clarifications. I don't intend to reconstruct. I think this
patchset can also be treated as "patch some missing places so that
kernel doesn't soft offline behind the back of userspace daemon".
I agree with you (IIUC) that the policy for corrected memory errors
should exist in userspace. But the situation is that some behaviors in
the kernel don't respect that (they either have a reason to not
respect, or just forget to respect). enable_soft_offline is basically
the big button in userspace to block these kernel violators.

>
> You can still have it by enabling CONFIG_X86_MCELOG_LEGACY and
> use http://www.mcelog.org or an equivalent daemon of your chosing
> that listens to /dev/mcelog.

If I didn't miss anything important in
https://github.com/andikleen/mcelog and
arch/x86/kernel/cpu/mce/dev-mcelog.c, I don't think /dev/mcelog works
on ARM platforms where CPER is used to convey hw errors from platform
to OS.

In addition, again taking an ARM platform as an example, I don't think
any userspace daemon has the way to stop the GHES driver from soft
offlining memory pages:
https://github.com/torvalds/linux/blob/master/drivers/acpi/apei/ghes.c#L521=
.
But of course it is not a problem if userspace always wants soft
offline to happen.

>
> -Andi
>
>


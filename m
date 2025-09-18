Return-Path: <linux-doc+bounces-60059-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EFAB54132
	for <lists+linux-doc@lfdr.de>; Fri, 12 Sep 2025 05:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7B9A5A4CD4
	for <lists+linux-doc@lfdr.de>; Fri, 12 Sep 2025 03:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE91258ED9;
	Fri, 12 Sep 2025 03:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpnEjaM8"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF930221FCA
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 03:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757649053; cv=none; b=d04rUK6nQBAy9enwawANHilqAhpsQNqqtRnEWvBKrR5juDPQcHrZZFVbUG/OQ+F9iJbc33RQEQAGc9UXcT9sBjUMPYenqd7Hk5oY/kMM7QMnO4w2asp61NYBqFKWvsSPbxS/qVUrJIphFjfrNPjg3atPAnu6a1obcNzd4uh53I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757649053; c=relaxed/simple;
	bh=O15VXX7CiSvMfgphQJJ8QbdeIhFmswmgeEjcFpgr2/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=XI80+u0ULI614MzBpfOEU8OQRgPJzjaFn1NozSlZBNjuW7f4bmjDycyXLr41iQlV4Y72767NWCqGWZnGAVjZnzjNcIrzg1mi7t5Tyy/YR7bayU6GbpOFe4Fjwo8SxSacFZy1/8/wOCUvGYDXpQ8eAQkxSKILPUGUYxKZJ3gCGEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpnEjaM8; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-72816012c5cso11727216d6.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 20:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757649051; x=1758253851; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxKDeouq1Jz+sW/FOChVWGc+16LkhNN1vYGkDkTz7ac=;
        b=WpnEjaM8Q24Uc+0rhseWYus1NC7iJxYGLo/A927ZR3XwWnGx8gOvh0c/StIClsMf87
         JMg4iX+wYxuc1bgSWbYM3E4ewJRbD5p29n1G3QT7ltbavfvfkTKZu34P8HDOtVXPW3pZ
         deWs/g1liiYvtqWyO7UeYtv9x3oCk39YPkuIQq5rD1MCCb43hjWvbVKPTH5u3DQPlT17
         zq5z569pR+miJhub6JXLC3LbGvHzcT1Dg+ONlsQbnhHsiAPRorSgZDxJ2x+cna1u0dSO
         zWLL8fQ16X5/9ruVA1wci69zyUmbQAClDiguX71ZhBVtbpk81E6bOpcX8TyWiUY9aN3r
         g8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757649051; x=1758253851;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxKDeouq1Jz+sW/FOChVWGc+16LkhNN1vYGkDkTz7ac=;
        b=GL6/8mJ3eyQa2mKjzn6/aIaSfDHYhPT+ganOKlaR4ycLtk6UEQuS3NkYAUJB/NJmvU
         b2lal9AYMcoD4ksP5gYJ4+QruB9BT6wmjcWNFlbNH/HXdos7CVFtNOpijRbLiN9WrVWi
         /O7Q8uErxmw+VPBsftR9mFjN4454QepLnfN/5UvVVVbbHi9nG4YN2+ndlhT1psZNxaHK
         wbVn6rk181383SugRJf9/C6U9CFnQsp5BAGuSLseku/hlHwyJxXsFf9/GJBPRJSMC1f2
         UkCpsjcqqcVx3tMh2WZDcYQ5efvIhOf5whA5KFcGI9iTHg4YlcevdKa1NhxwAjkpnv28
         cyjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqzN8f424p3snndy3hYH7HeEimzESsi6iu0vnIN4zPIv20wY8MGzobnElBPzTbonN9u0xB3xQUkwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsC4nB/65k2qaQIbZM+HXJAtnvBqJp12uehiNCoD29Fk4EO6vn
	rT4cq4txnB71TFiwqtfON41P8JQoT3aypVWQrpjx2fUXz8RSz2IUvOoA8NmItsXYF1hJaMZYMO3
	nIg6cRdRM9gDLr23OcavVkPKLfcS5ZCM=
X-Gm-Gg: ASbGncsRL7tByPzHagFSTt0B8uZ7Bo3eW6jFfQiX6bAlYeAHO5d4n93fmCABHIuZTd0
	1QFBUz6O9N/w6/5j7D0w8g04Q053YWRv+QfRe+T+fdc4ngkcV2SDjBmiK+ai5BWRRIvXNimmWo9
	44yHtXZrGUMAmMqFvbw+xaVc/A4429IVWPb1nVAQuy4SlUWAiJeF5bKErA3Se43D9jO8uHYaVDd
	SuqgPwbtfMMT9slRlkxETmaky4p2RKZWS+ehZw4rDKAtaovzUE=
X-Google-Smtp-Source: AGHT+IE2lmMwOFsF54r8KI3I1gAGZdDCoc39UpVpNOR9hMYiRAaoAhl3WvDfRMHh4wich6Y8JpLErqu8L8REitpUGys=
X-Received: by 2002:a05:6214:1d2d:b0:731:19d0:8445 with SMTP id
 6a1803df08f44-767c6a4e845mr24554406d6.67.1757649050651; Thu, 11 Sep 2025
 20:50:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910024447.64788-1-laoar.shao@gmail.com> <20250910024447.64788-7-laoar.shao@gmail.com>
 <mi5gf7wvm3hjnfm3gkrye5mpzcxlmfkzy55oqhaqdbsnnwxjfc@teia7omm3ujl>
In-Reply-To: <mi5gf7wvm3hjnfm3gkrye5mpzcxlmfkzy55oqhaqdbsnnwxjfc@teia7omm3ujl>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 12 Sep 2025 11:50:14 +0800
X-Gm-Features: AS18NWBGEeYXW5rJQyKJltmwf7rCjqkS8uOdNFWA0xUoCqDNbzrj8Y0YAHG5g_8
Message-ID: <CALOAHbDAOFjFD1Njojp=x9As-FSDwhZnFjioM5-uBoGfvPSANA@mail.gmail.com>
Subject: Re: [PATCH v7 mm-new 06/10] bpf: mark vma->vm_mm as __safe_trusted_or_null
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Yafang Shao <laoar.shao@gmail.com>, 
	akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, hannes@cmpxchg.org, 
	usamaarif642@gmail.com, gutierrez.asier@huawei-partners.com, 
	willy@infradead.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	ameryhung@gmail.com, rientjes@google.com, corbet@lwn.net, 21cnbao@gmail.com, 
	shakeel.butt@linux.dev, bpf@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 1:31=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Yafang Shao <laoar.shao@gmail.com> [250909 22:46]:
> > The vma->vm_mm might be NULL and it can be accessed outside of RCU. Thu=
s,
> > we can mark it as trusted_or_null. With this change, BPF helpers can sa=
fely
> > access vma->vm_mm to retrieve the associated mm_struct from the VMA.
> > Then we can make policy decision from the VMA.
>
> I don't agree with any of that statement.
>
> How are you getting a vma outside an rcu lock safely?

The callers of this BPF hook guarantee that the provided
vm_area_struct pointer is safe to read. This means your BPF program
can safely access its members, though it cannot write to them.

You might question how code in lsm.c can access
vma->vm_mm->start_stack without an explicit NULL check. This is
because the BPF verifier has a safety feature: if vma->vm_mm is NULL,
it will substitute the value 0 instead of actually performing the
dereference, preventing a crash.

However, while this prevents a kernel panic, it doesn't guarantee
correct logic. If your program uses the value 0 for start_stack
without knowing it came from a NULL pointer, it might behave
incorrectly. Therefore, you must still explicitly check for NULL to
ensure your program's logic is sound.

The __safe_trusted_or_null marker enforces this requirement. It is a
restriction that ensures program correctness, not a loosening of the
rules.

Alex, Andrii, please correct me if my understanding is wrong.

>
> vmas are RCU type safe so I don't think you can make the statement of
> null or trusted.  You can get a vma that has moved to another mm if you
> are not careful.
>
> What am I missing?  Surely there is more context to add to this commit
> message.

According to the definition of struct vm_area_struct, the comment on
vm_mm states: "Unstable RCU readers are allowed to read this." This
confirms that we can safely read vm_mm without holding the RCU read
lock. If this were not the case, the comment would need to be
corrected.

  struct vm_area_struct {
         /*
         * The address space we belong to.
         * Unstable RCU readers are allowed to read this.
         */
         struct mm_struct *vm_mm;
  };

As a minor, unrelated note: Non-sleepable BPF programs always run
within an RCU read-side critical section. Therefore, you do not need
to explicitly acquire the RCU read lock in such programs.

--=20
Regards
Yafang


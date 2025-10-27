Return-Path: <linux-doc+bounces-64763-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F61C11E33
	for <lists+linux-doc@lfdr.de>; Mon, 27 Oct 2025 23:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CF1314FFFF5
	for <lists+linux-doc@lfdr.de>; Mon, 27 Oct 2025 22:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B817F32E72F;
	Mon, 27 Oct 2025 22:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3bOrsLM"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41513346AB
	for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 22:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761605185; cv=none; b=tif03uGx0+SVrvt0S39EHl1m4wl7TKXxszCnHw4T2CA7PsByupb52H7u1qhIGHHGUMYl9ElBYOEvQrtuuf8vowAuBsRgFU/8XsXfbiRo+t2HG5iCQG5qpPZgP88kxeR47kXPb0q2kRoCL4DkS7sSW3bBxoE/H+U+rO+Z5bsZkuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761605185; c=relaxed/simple;
	bh=YbNF9xBLgvPcEJ73q19bteNh3qQ4EWHWmqaSpEAAHPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RyU3XKWNgm53O3bMwrd/xNUmKFR9aE7mecG7jeAGKyNLqr5nVYi7or30ClEOrj1m2QF5weMFCwhl8nFZsoCZkNsLlznJQ6zZsqA2aMRafNhEZAgaKxkBMOixrGMrakmp0audsG/ghSR+hya3q4stjboWGFjSXl3Nkt2drJJSXXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3bOrsLM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-475dbc3c9efso19996125e9.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 15:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761605182; x=1762209982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbNF9xBLgvPcEJ73q19bteNh3qQ4EWHWmqaSpEAAHPI=;
        b=R3bOrsLM90ph+zhd05Sn7igSwGIPADBCQVTuFiwym7wQ8MlicFuMlUzlwD2gBHkY3f
         1KuwPuFQ8RbZMqTBSMUpT/qtBmK5aMAQ7cc0iuJVDgU5uJ2JP8ELO+8oOF9euAndL0ZV
         z2KYBXeHISmwQsR38TzkRPbMniliWRieXTugL++3ur17WWTnGkzyWiuGywC56NZcbsDg
         cjbrKZy+OqahFx7qRKsT+L1Xl6g3ibUFErq/MNJguA8hRjaxIMnqHW+y3JV1JUvGjPH/
         +5UkA1HTvjPxAFujFHJBPFPWPsFWNbOUUW9S6zQhcecFM0Z4hIzTmG4E9iGm+Wo72lRi
         APZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761605182; x=1762209982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbNF9xBLgvPcEJ73q19bteNh3qQ4EWHWmqaSpEAAHPI=;
        b=k+4ckrAPfBRErFSKpA0SFVo8JpQjt4PFHspjV/jr512toaq7ppXzAguCB6W0TcxrDf
         upQcbxwK8yM8GqVuM7Wsa/qrgEQjKAG7LY+dJlXEP0fB+Pbfh+iymXT8wsZCV8UcY5e+
         Z09y52V/2rjleZGM5NG9DlfGXrXa3gn9dtCYYiTcRkJOvM3b9D8wRnpbIZOrarVmV9aK
         2yZBnkTz7oGySxtluwh9pB5AoNUn0Ne8j3JbIkVx2HCIorlv+YSAErCimhSrWYi13/Js
         SJwIx3veuPu5h/ugwa7SONZyAh2l7VV2O/7FlPeGy/SCKJ9HCn3Nn9NhkY6VT8Fo9R3r
         Oouw==
X-Forwarded-Encrypted: i=1; AJvYcCWvYJ1Y8BOYKmNoMhYmtyxiz9JKZX3/hjKVgXDW1DUxS1+8/UUCtj8L7QUFbNQwg0SRkiVLMcRFaMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmIPzbJmKyhXgu5FAhMzBpuEjqGKgjWeUlPlCFYZNr8VuzWxH7
	ofG712NcwfqGYZmXIJcjdUrlhHNmp0t9cqpXFUAoO9NXLOEvgpeck+Sg+y8wmv6yY4YLkIgaC6Y
	US7/rdSy8qMxx/vpFCu9rODOr7pjzGo8=
X-Gm-Gg: ASbGncuvnicfZKs70zwSof7wXYBgoihapjeoqXEOQusC6v+UZuUOM89OFhPOZj7f1cw
	czv4shR6NbhzX7GUP4mNQp9W2xzK/vpT49nvRtXq3eZ5gY0dsDSgq5Boe1pzXTsbi4IiC4fyfGf
	+JbLW9Ix7FYukv2BALhvzJQt70aCgJAPnxOv9p+im4zgK1R7hrJcgsc1vEb6UFYDc8K0lj4cTNA
	rnAiQG9cPsy6hJ2iX++fUEe69mCKY4Fve0xqfk4bgYV+ueJIu8YVP57jpO7vi6gv5J1DA==
X-Google-Smtp-Source: AGHT+IEeNWo2bsGLLqGLfQNsY0L6lNVZZ2khSDzRsqsRr6Jo8tC6B0Avoq1yBzRM+ieeQ79ZgiTz+pEgGuOt7PLnUe4=
X-Received: by 2002:a05:600c:46d3:b0:471:1415:b545 with SMTP id
 5b1f17b1804b1-47717def6demr11070845e9.7.1761605181955; Mon, 27 Oct 2025
 15:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761439133.git.jinji.z.zhong@gmail.com>
In-Reply-To: <cover.1761439133.git.jinji.z.zhong@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 27 Oct 2025 15:46:10 -0700
X-Gm-Features: AWmQ_bma6lyHlpvPtwTt1egk70m2KnBJDjgat6AjIDzKFfoBCYrn6d-bXve4s8M
Message-ID: <CAKEwX=MqsyWki+DfzePb3SwXWTZ_2tcDV-ONBQu62=otnBXCiQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Introduce per-cgroup compression priority
To: jinji zhong <jinji.z.zhong@gmail.com>
Cc: minchan@kernel.org, senozhatsky@chromium.org, philipp.reisner@linbit.com, 
	lars.ellenberg@linbit.com, christoph.boehmwalder@linbit.com, corbet@lwn.net, 
	tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, axboe@kernel.dk, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	akpm@linux-foundation.org, terrelln@fb.com, dsterba@suse.com, 
	muchun.song@linux.dev, linux-kernel@vger.kernel.org, 
	drbd-dev@lists.linbit.com, linux-doc@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org, zhongjinji@honor.com, 
	liulu.liu@honor.com, feng.han@honor.com, 
	YoungJun Park <youngjun.park@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 25, 2025 at 6:53=E2=80=AFPM jinji zhong <jinji.z.zhong@gmail.co=
m> wrote:
>
> Hello everyone,
>
> On Android, different applications have varying tolerance for
> decompression latency. Applications with higher tolerance for
> decompression latency are better suited for algorithms like ZSTD,
> which provides high compression ratio but slower decompression
> speed. Conversely, applications with lower tolerance for
> decompression latency can use algorithms like LZ4 or LZO that
> offer faster decompression but lower compression ratios. For example,
> lightweight applications (with few anonymous pages) or applications
> without foreground UI typically have higher tolerance for decompression
> latency.
>
> Similarly, in memory allocation slow paths or under high CPU
> pressure, using algorithms with faster compression speeds might
> be more appropriate.
>
> This patch introduces a per-cgroup compression priority mechanism,
> where different compression priorities map to different algorithms.
> This allows administrators to select appropriate compression
> algorithms on a per-cgroup basis.
>
> Currently, this patch is experimental and we would greatly
> appreciate community feedback. I'm uncertain whether obtaining
> compression priority via get_cgroup_comp_priority in zram is the
> best approach. While this implementation is convenient, it seems
> somewhat unusual. Perhaps the next step should be to pass
> compression priority through page->private.

I agree with TJ's and Shakeel's take on this. You (or some other
zram/zswap users) will have to present a more compelling case for the
necessity of a hierarchical structure for this property :)

The semantics itself is unclear to me - what's the default? How should
inheritance be defined? What happens when cgroups are killed etc?

As a side note, seems like there is a proposal for swap device
priority (+ Youngjun)

https://lore.kernel.org/all/20250716202006.3640584-1-youngjun.park@lge.com/

Is this something you can leverage?

Another alternative is to make this zram-internal, i.e add knobs to
zram sysfs, or extend the recomp parameter. I'll defer to zram
maintainers and users to comment on this :)


Return-Path: <linux-doc+bounces-63118-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 82511BD4BE2
	for <lists+linux-doc@lfdr.de>; Mon, 13 Oct 2025 18:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2C9D5350761
	for <lists+linux-doc@lfdr.de>; Mon, 13 Oct 2025 16:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379D9314D02;
	Mon, 13 Oct 2025 15:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f5HycyPM"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B38314B83
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370211; cv=none; b=jXmoO40C2qCJyw2PlztIzIS1tnW5CYOv/jCXf6lBqB5XmslldDugFZ8i3rt9fr1mcADkkJbvztYgrM/mtld4CxcOSgOqdqebl583jeGZ4oNnDjbbS2e7oJYQ2vCGxO0fI/jOKE94E272Gsmj5US3IdvKHDgTEoWAKkNQbBAAveI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370211; c=relaxed/simple;
	bh=kIVPmCT9kaUq2YA1N7gOyA1JcTYZFNkXFcLBy2dOX+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VyjEK+KKBU+7a1uAgHKxjXL+JyKU2/dtwrTVbVK03naWNIg0rHN9/cGtRaHR31q7vU3t3fM72LTH+gdKVyq8RShvQChRw8wnMXZclCWA21k1oCgVHMyhEqWjAhlSUBo8k/LPyVQLPgO6d6MvSxF82HGR8KfpEtlUM1DxsV+1qtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f5HycyPM; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-42d7d0c58f9so635115ab.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 08:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760370208; x=1760975008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvE2QaubCaNe+b2bi3Ii9pwdFgyDED1xYIH2KKqTA4w=;
        b=f5HycyPMTH8rgVXgmQyTiokCXEZEUXPC7ztFDYuZh5VzPNxNZeu2Rt563ptKcRa2Oi
         iclOKSQ/2x29qvifa/uMyBvXW1XemFrAbEqgk82kkPxoYqgsZsc0sxFysITyih+38/JO
         dW9xmyl383ZTkEkqxIzzaG1rw/qWB9ClSp947Dz21GpvD9vFJQowdo7dvR8C3LgteHbE
         Y9JImsi4S5TSpk4goUl9dRFm43rf8xcapzv9+WQ3dWXX4LX2jPruekr+uNatluT3t9ry
         ht4Y6Y/k6aKum3kd2Qjhmuqy72ssxE8YayuiRVd47O+XtSaaf7NmyjaEarlFVI5Znsak
         yRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370208; x=1760975008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvE2QaubCaNe+b2bi3Ii9pwdFgyDED1xYIH2KKqTA4w=;
        b=Lf8L0bGRVYyjfduTuQ/08/zLgQwgzmeSDZg7g0cll9N5Peqdk8VaDS6PDAS0ko/r1u
         oHE8M3gp0yFTNTzep/q1wlOdg+t0BK9F86s5B8MTUq/fez9bZ7I6xE4JE6XJqOjSBFOt
         ezFMfHuBMd4nq5Ry7x3ibbcEvkvCgPm5PZgUmFqKq5oBOZNpDVv3c8aJcALVPxByAafn
         88Szk9r4OvgJMDU6QG5B0k3YAa2nLfwknOEjQHBZljUO8iIihd5M0AJ1ItVpL3TBtdwQ
         748KUmk94OuCrD+HU+xFLjZsl3VoY2JV0CAvWuHcVHmpURCJOyZQK9OPM1aUTLUgOqMO
         IMng==
X-Forwarded-Encrypted: i=1; AJvYcCUebHvJD5vIHyIF9Gq6NlTOu7VTJPZbCfetxwnLoxdKo7NcbrHsTGa6Ae0qiqHuFigRaq82gIZt9PY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhMUHS+BO+BJ2leCjlXHLKZA79QXzjCiTF0a51ry7pavunAOoU
	eR1gyTvylZpRD4gc5RnSLgsecM0Iy5fatEVFzCCMgKa57PdjDfiCxWD/yX2ZrxZcf3yiylcL2VB
	rzvLxP1Rn36NzphPTB/Z+hA9ODokY2F2j1SOK9SHi
X-Gm-Gg: ASbGncucQlOU6ZabxwrtSj4if8iqQBb5L6uOQ+nmbLsonRbPe0+WOxw25URjvDgqEMF
	k0stfQd19f9+YBgy13sIPCCFPvpEyhPMRT2ZbBohqzFhX7LB9p71ut+D6Dax6qfsCZvzi7fUDi6
	FX7bp/Wd8+7kuVK5E05Zqa761KEkAePBqwPTroZpM4ufIEuY9KG56Jap/ZWToDyG8nwJrJHUYWg
	G16GvO4rbduzNve/Qm94Mc0Wcu9qZ2deg+CTtULiu5RKOMeGcbl
X-Google-Smtp-Source: AGHT+IGi9WTnaWtP/uIr7PgRC+0JilLcGDbVVnkS9tGZZgbSezgQwLrXzu3IZ+mvJsC1St6EdcqZZFWTwoYrtUBb1Hk=
X-Received: by 2002:a05:622a:808d:b0:4e6:eaea:af3f with SMTP id
 d75a77b69052e-4e6eaeaaf5dmr26573411cf.3.1760370207737; Mon, 13 Oct 2025
 08:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010011951.2136980-1-surenb@google.com> <20251010011951.2136980-2-surenb@google.com>
 <aOyf5FxH8rXmCxLX@infradead.org>
In-Reply-To: <aOyf5FxH8rXmCxLX@infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Oct 2025 08:43:16 -0700
X-Gm-Features: AS18NWAw--9GoJimKYZPU6XtnCpJ2t59ru9kAaQP92i8jW-vrfiHymNpWuM0LSo
Message-ID: <CAJuCfpFs5aKv8E96YC_pasNjH6=eukTuS2X8f=nBGiiuE0Nwhg@mail.gmail.com>
Subject: Re: [PATCH 1/8] mm: implement cleancache
To: Christoph Hellwig <hch@infradead.org>
Cc: akpm@linux-foundation.org, david@redhat.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, alexandru.elisei@arm.com, 
	peterx@redhat.com, sj@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	corbet@lwn.net, axboe@kernel.dk, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, willy@infradead.org, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, hannes@cmpxchg.org, zhengqi.arch@bytedance.com, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, minchan@kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	iommu@lists.linux.dev, Minchan Kim <minchan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 12, 2025 at 11:44=E2=80=AFPM Christoph Hellwig <hch@infradead.o=
rg> wrote:
>
> Please don't add abstractions just because you can.  Just call directly
> into your gcma code instead of adding a costly abstraction with a single
> user.  That'll also make it much eaiser to review what GCMA actually
> does.

Are you suggesting to fold cleancache into GCMA? GCMA is the first
backend donating its memory to the cleancache but other memory
carveout owners can do that too. The next two on my list are MTE tag
storage and memory reserved by kdump.
Also note that the original GCMA proposal from 2015 [1] used both
cleancache and frontswap to donate its memory. We don't have frontswap
today, but this shows that it doesn't have to be a 1-to-1 relation
between GCMA and cleancache.
Thanks,
Suren.

[1] https://lore.kernel.org/all/1424721263-25314-4-git-send-email-sj38.park=
@gmail.com/


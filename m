Return-Path: <linux-doc+bounces-51139-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B98AED2E8
	for <lists+linux-doc@lfdr.de>; Mon, 30 Jun 2025 05:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F440189456A
	for <lists+linux-doc@lfdr.de>; Mon, 30 Jun 2025 03:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC50315573A;
	Mon, 30 Jun 2025 03:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C2Bz+pga"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF262154BF5
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 03:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751253930; cv=none; b=RBCx1Y7O0e6ITTyc8n/zJ1TIODeSEwKuozQRdwIYS32No6tXBE46cEWYdwstiWRPCeJ04EV7erBAt3aM3/IH3F9prjbbglrfrutREpLLMi5Y9uduvVKTHN1G1RA8NLIMxlaw0ZD+XlyDuQW7PTDz14+p7Yq1wD87+ZU8SjLf+PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751253930; c=relaxed/simple;
	bh=LV1RbfJMboY121pq/OVMD9JfCIwBjXF7y439XzrIWzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nzx1Bv36ung0O6CRpd2nyPxmFelHvfw0q6qQEvzXiKS02YZ0qKrhyqruLN+BggT//w+msm2MruRcWSJdNZ8Zf2Q2sWF9BcbV8O+oWm5f7fACsA/MQ5b4kmaSPUZjDtbRVvwpYQ0jZBpFr6eVt10J0p6p6W2SbOMZdeh2QH79JjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C2Bz+pga; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751253927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AdAJraI8U0XhGTjVP+sopEbvVySi3zH6N4wromX92ys=;
	b=C2Bz+pgayz4EfMArg7Q9RyciJtlmcaGjW+2lkkzz50XkxADAFjJhl2enCGmhrB3uXU+fu1
	HYYHM27Tl27suhuMBUuuG2ggAEH5S18eaznPjak7waMhlBnVNjOz4s6KkCcBrkGByyTRWw
	brMUSmYP0ybOk6LBVGqePeHKxmfCY6A=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-PdCICT_rOBC0perHmLb7kQ-1; Sun, 29 Jun 2025 23:25:26 -0400
X-MC-Unique: PdCICT_rOBC0perHmLb7kQ-1
X-Mimecast-MFC-AGG-ID: PdCICT_rOBC0perHmLb7kQ_1751253925
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5551b49f37fso293448e87.0
        for <linux-doc@vger.kernel.org>; Sun, 29 Jun 2025 20:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751253924; x=1751858724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdAJraI8U0XhGTjVP+sopEbvVySi3zH6N4wromX92ys=;
        b=avXhIfPGkwk+4U7xe69LXDCE5MOotJ7ib6+7mgOEK1fJvgA3tlmrBCgMKzBVG/8/vZ
         xmsfTW1yaEBho7WOfmyctXgj8x42On0aJuwcvxAcP5bkPzrsvp2l+bYp7/qu3hlYo3u6
         8bUC38ZrLff0TnMLzspgzmQzDwgU+UKqNd74JQBGXMIwiHKpp8qtARGN2McRqbxJV9KL
         Gu4n3emJ46WrAo3RVNtzg6VbluQLrB9wBYHG3ScmZ0B6uI6AJmry7+vPt7Hs5ZrT2hQr
         i4IIUpOHav9KGGiR+LuEBrkSF2xqBxw9mr/zGD9CwdBCqL21ceGnmsXUztfC40WjTcMM
         Zcew==
X-Forwarded-Encrypted: i=1; AJvYcCXrZMEaQ7g4td76rPxk3p/S0enX6vkTVBX3e0huo7rrP+AjfcvHvOFihrKL6Nz00OVgCwZEotJ5RgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPG8JRj5L5RfVz/ZhdzTGlGcqXHHbfdougzB1L6Lbf1xflPOGJ
	qIO+etShoHgO289A9XxiravYeAREvUW5ny4isdhGO3TovR7ESnQxh27vkPyFqUNMyOgl754jP/P
	EId6EWGY2/dkCK/nFQc0tzkcxdFsinZUYVO5XiPLphz74C7XS+tL+v3BAfEolo/eRNR3a0NjAtf
	pqSpuC9HH1+9L+zUPRKuMk70TSnMmZciI7McNx
X-Gm-Gg: ASbGncuoVg5Chn58lDGAYX71QR3j4PKyB8jhoLfk43lAhqZfXcq8waPR1SwIjdTwmM4
	I49lggriekPuagisDL9laWoiyOR2OIUu+vct7rCXPk1GmH0wsOzGp+8mBkhrDEzjWsn9GNQrqXU
	m53I6Y
X-Received: by 2002:a05:6512:4007:b0:553:5283:980f with SMTP id 2adb3069b0e04-5550ba29ed0mr4059527e87.51.1751253924562;
        Sun, 29 Jun 2025 20:25:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGyLLTQ+hUO0WJJg7JLMiyQj3myWZqAvEdNrAeYoZ9AFQ3o2tQ0Qa2acrnVn4SpO4MOI2jPSt7MbClt01/TxM=
X-Received: by 2002:a05:6512:4007:b0:553:5283:980f with SMTP id
 2adb3069b0e04-5550ba29ed0mr4059516e87.51.1751253924142; Sun, 29 Jun 2025
 20:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524061320.370630-1-yukuai1@huaweicloud.com>
 <808d3fb3-92a9-4a25-a70c-7408f20fb554@redhat.com> <288be678-990b-86f9-1ffd-858cee18eef3@huaweicloud.com>
In-Reply-To: <288be678-990b-86f9-1ffd-858cee18eef3@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Mon, 30 Jun 2025 11:25:12 +0800
X-Gm-Features: Ac12FXy84WM0Pt-z6-03Ek6OEzyZO-QLHqRx9zGvHmE5_V1IAcfGF77I2Lcfu28
Message-ID: <CALTww28grnb=2tpJOG1o+rKG4rD7chjtV3Nmx9D1GJjQtVqWhA@mail.gmail.com>
Subject: Re: [PATCH 00/23] md/llbitmap: md/md-llbitmap: introduce a new
 lockless bitmap
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@lst.de, colyli@kernel.org, song@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, yi.zhang@huawei.com, 
	yangerkun@huawei.com, johnny.chenyi@huawei.com, 
	"yukuai (C)" <yukuai3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 10:34=E2=80=AFAM Yu Kuai <yukuai1@huaweicloud.com> =
wrote:
>
> Hi,
>
> =E5=9C=A8 2025/06/30 9:59, Xiao Ni =E5=86=99=E9=81=93:
> >
> > After reading other patches, I want to check if I understand right.
> >
> > The first write sets the bitmap bit. The second write which hits the
> > same block (one sector, 512 bits) will call llbitmap_infect_dirty_bits
> > to set all other bits. Then the third write doesn't need to set bitmap
> > bits. If I'm right, the comments above should say only the first two
> > writes have additional overhead?
>
> Yes, for the same bit, it's twice; For different bit in the same block,
> it's third, by infect all bits in the block in the second.

For different bits in the same block, test_and_set_bit(bit,
pctl->dirty) should be true too, right? So it infects other bits when
second write hits the same block too.

[946761.035079] llbitmap_set_page_dirty:390 page[0] offset 2024, block 3
[946761.035430] llbitmap_state_machine:646 delay raid456 initial recovery
[946761.035802] llbitmap_state_machine:652 bit 1001 state from 0 to 3
[946761.036498] llbitmap_set_page_dirty:390 page[0] offset 2025, block 3
[946761.036856] llbitmap_set_page_dirty:403 call llbitmap_infect_dirty_bits

As the debug logs show, different bits in the same block, the second
write (offset 2025) infects other bits.

>
>   For Reload action, if the bitmap bit is
> > NeedSync, the changed status will be x. It can't trigger resync/recover=
y.
>
> This is not expected, see llbitmap_state_machine(), if old or new state
> is need_sync, it will trigger a resync.
>
> c =3D llbitmap_read(llbitmap, start);
> if (c =3D=3D BitNeedSync)
>   need_resync =3D true;
> -> for RELOAD case, need_resync is still set.
>
> state =3D state_machine[c][action];
> if (state =3D=3D BitNone)
>   continue

If bitmap bit is BitNeedSync,
state_machine[BitNeedSync][BitmapActionReload] returns BitNone, so if
(state =3D=3D BitNone) is true, it can't set MD_RECOVERY_NEEDED and it
can't start sync after assembling the array.

> if (state =3D=3D BitNeedSync)
>   need_resync =3D true;
>
> >
> > For example:
> >
> > cat /sys/block/md127/md/llbitmap/bits
> > unwritten 3480
> > clean 2
> > dirty 0
> > need sync 510
> >
> > It doesn't do resync after aseembling the array. Does it need to modify
> > the changed status from x to NeedSync?
>
> Can you explain in detail how to reporduce this? Aseembling in my VM is
> fine.

I added many debug logs, so the sync request runs slowly. The test I do:
mdadm -CR /dev/md0 -l5 -n3 /dev/loop[0-2] --bitmap=3Dlockless -x 1 /dev/loo=
p3
dd if=3D/dev/zero of=3D/dev/md0 bs=3D1M count=3D1 seek=3D500 oflag=3Ddirect
mdadm --stop /dev/md0 (the sync thread finishes the region that two
bitmap bits represent, so you can see llbitmap/bits has 510 bits (need
sync))
mdadm -As

Regards
Xiao
>
> Thanks,
> Kuai
>
>



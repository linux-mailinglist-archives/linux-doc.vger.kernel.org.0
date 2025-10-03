Return-Path: <linux-doc+bounces-62400-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2497BB7BFF
	for <lists+linux-doc@lfdr.de>; Fri, 03 Oct 2025 19:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 968273ABFA2
	for <lists+linux-doc@lfdr.de>; Fri,  3 Oct 2025 17:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3DA62DA77F;
	Fri,  3 Oct 2025 17:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="diqUfvnA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C441A24468D
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 17:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759512768; cv=none; b=uUldZPFyYGaz/CZ9NaCXiDm4NSYrv4qozRh2Um4zDYd4/ADWMViONPRnrpEneAEtD0my71+nq3JqJGQbF8JSnQxHIO/q2t0NC79lezXDDa0ArCy+OUHdpTPYgfhgBli470vf3vYuFnr/1PC5MVumDGLtOyizRwaLXj13tlJS18g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759512768; c=relaxed/simple;
	bh=BoUvXUx1856Z2mp9veLGPB9txmBh/kcwlgQ9qzc/WoA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NweNH1jTXO1sX4myN62OdxUOmb7yDmnTyUoeL4B8PaYbNWFIzFzVN6ZBnAOEuzIbZGGg4Kt9SPr4VeQPwNOl0ArnL9Kv74gdexBn/ZMYRV/BHHgG1Lt5HIkpEfhlcUhN34pNwGM6cv5aayJC7QR9GuvZc5yqdfJQr+Qr5UJxQsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=diqUfvnA; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-634700fe857so3480747a12.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 10:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759512765; x=1760117565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9rtqteAJeUmRGsxg/Z0dCTAtvo7UMTgyQH1Vgz2I+fM=;
        b=diqUfvnApUEkdnJID1fl17MQVUjL/VEB+ArnnXk62k0nVj5JAu3sQAyBXFkmq52Oo4
         HlWWM8P1azL9KOLSQFMpHl/XXFe0DFsAH3KIOIJyrKhUNQXRuQOi1dAdQOn1LqAo6PUU
         EkExuDqzWrlNLbniHSsYClIO4k6C10TWg0ZiwahPwx4Pv/xk6J7LcgP2MakTP/3aYDZo
         a8z6u2eJCB923cmuUHPnom7gKwBYz8PXdm2IZtjv5ZCPbv8DORJcG3kw+Pp61W0zlHX0
         Srdo6bOHy9Nqtata8J4p1iXYfNPbcJr1N8j9TWKPGd0mka6nQntRcL+0kO/7F2FccQqs
         sQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759512765; x=1760117565;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rtqteAJeUmRGsxg/Z0dCTAtvo7UMTgyQH1Vgz2I+fM=;
        b=YE78wrxf0qhCrYQYQbcjo2aaDcllE18A8l4y6gRGb8/cPo6YRBY/eyn6bqtUcMV0gR
         w8ZM3lEYmg8y6GOf7o+lw0RIPU/A0eZPgpvdOE373inbaXsIfSs9whde7adEEPDDk/0R
         l5JGOvDLR20ii8SJH0pqysuT22DgPnjNFj/AAktrzj2+NcdirYlS/X8SZ4GRoTpoEu32
         g5uai8m3z3KrzR99F5o5M/b0UtaT7BmI9d9UWFKsh9//lyw2b34WdY/fRtj4spSU7IeY
         2TLpgl9doomROvKTRZI6V9TH6KRSDrrtXTGqeT8SViyBp9mIahV2lZWT+Huu5E89VM3e
         T2eQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3NP0al8An0iFAV+xn6H5uft3cwcmWTkOkES03Q7vq3SGAXqnjNBAqlymQqdWa6PPBjBPRS4Ngu5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaxjlDzH1Y3rgqeQVDzWwSsosTOpAjztfzCnSsnPkrJ87YBts1
	VbMvNLcHJXa+Ion5ChmtgiWqzboht1muReVliRh3uGLfkPHHkC+F3xYv+bqC4XC7zJxpoQ00Yg8
	AkjGuGfQFcndgkg==
X-Google-Smtp-Source: AGHT+IGlpvvYRqRysNX3SlhoP9uszCyEAfse5Ll61mfhygdHXMca2IgjMh5S/svFSAScgQFHPBRqwfLja/G1hQ==
X-Received: from edwr10.prod.google.com ([2002:a05:6402:34a:b0:62f:9fc4:ce8f])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:184b:b0:634:a23e:df26 with SMTP id 4fb4d7f45d1cf-638fcb7c9d0mr3359707a12.6.1759512765118;
 Fri, 03 Oct 2025 10:32:45 -0700 (PDT)
Date: Fri,  3 Oct 2025 17:32:25 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003173229.1533640-1-smostafa@google.com>
Subject: [RFC PATCH 0/4] iommu: Add IOMMU_DEBUG_PAGEALLOC sanitizer
From: Mostafa Saleh <smostafa@google.com>
To: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: corbet@lwn.net, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Overview
--------
This patch series introduces a new debugging feature,
IOMMU_DEBUG_PAGEALLOC, designed to catch DMA use-after-free bugs
and IOMMU mapping leaks from buggy drivers.

The kernel has powerful sanitizers like KASAN and DEBUG_PAGEALLOC
for catching CPU-side memory corruption. However, there is limited
runtime sanitization for DMA mappings managed by the IOMMU. A buggy
driver can free a page while it is still mapped for DMA, leading to
memory corruption or use-after-free vulnerabilities when that page is
reallocated and used for a different purpose.

Inspired by DEBUG_PAGEALLOC, this sanitizer tracks IOMMU mappings on a
per-page basis, as it=E2=80=99s not possible to unmap the pages, because it
requires to lock and walk all domains on every kernel free, instead we
rely on page_ext to add an IOMMU-specific mapping reference count for
each page.
And on each page allocated/freed from the kernel we simply check the
count and WARN if it is not zero.

Concurrency
-----------
By design this check is racy where one caller can map pages just after
the check, which can lead to false negatives.
In my opinion this is acceptable for sanitizers (for ex KCSAN have
that property).
Otherwise we have to implement locks in iommu_map/unmap for all domains
which is not favourable even for a debug feature.
The sanitizer only guarantees that the refcount itself doesn=E2=80=99t get
corrupted using atomics. And there are no false positives.

CPU vs IOMMU Page Size
----------------------
IOMMUs can use different page sizes and which can be non-homogeneous;
not even all of them have the same page size.

To solve this, the refcount is always incremented and decremented in
units of the smallest page size supported by the IOMMU domain. This
ensures the accounting remains consistent regardless of the size of
the map or unmap operation, otherwise double counting can happen.

Testing & Performance
---------------------
This was tested on Morello with Arm64 + SMMUv3
Also I booted RockPi-4b with Rockchip IOMMU.
Did some tests on Qemu including different SMMUv3/CPU page size (arm64).

I also ran dma_map_benchmark on Morello:

echo dma_map_benchmark > /sys/bus/pci/devices/0000\:06\:00.0/driver_overrid=
e
echo 0000:06:00.0 >  /sys/bus/pci/devices/0000\:06\:00.0/driver/unbind
echo 0000:06:00.0 > /sys/bus/pci/drivers/dma_map_benchmark/bind
./dma_map_bechmark -t $threads -g $nr_pages

CONFIG refers to "CONFIG_IOMMU_DEBUG_PAGEALLOC"
cmdline refer to "iommu.debug_pagealloc"
Numbers are (map latency)/(unmap latency), lower is better.

			CONFIG=3Dn    CONFIG=3Dy    CONFIG=3Dy
			            cmdline=3D0   cmdline=3D1
4K - 1 thread		0.1/0.6     0.1/0.6     0.1/0.7
4K - 4 threads		0.1/1.0     0.1/1.1     0.1/1.1
1M - 1 thread		0.8/21.2    0.8/21.2    5.6/42.5
1M - 4 threads		1.1/46.3    1.1/46.1    5.9/45.5

Thanks,
Mostafa

Mostafa Saleh (4):
  drivers/iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC
  drivers/iommu: Add calls for iommu debug
  drivers/iommu-debug: Track IOMMU pages
  drivers/iommu-debug: Check state of mapped/unmapped kernel memory

 .../admin-guide/kernel-parameters.txt         |   6 +
 drivers/iommu/Kconfig                         |  14 ++
 drivers/iommu/Makefile                        |   1 +
 drivers/iommu/iommu-debug.c                   | 160 ++++++++++++++++++
 drivers/iommu/iommu.c                         |  21 ++-
 include/linux/iommu-debug.h                   |  24 +++
 include/linux/mm.h                            |   7 +
 mm/page_ext.c                                 |   4 +
 8 files changed, 235 insertions(+), 2 deletions(-)
 create mode 100644 drivers/iommu/iommu-debug.c
 create mode 100644 include/linux/iommu-debug.h

--=20
2.51.0.618.g983fd99d29-goog



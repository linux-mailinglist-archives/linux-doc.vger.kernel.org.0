Return-Path: <linux-doc+bounces-63012-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AA8BD0043
	for <lists+linux-doc@lfdr.de>; Sun, 12 Oct 2025 09:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 24B503487D6
	for <lists+linux-doc@lfdr.de>; Sun, 12 Oct 2025 07:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0343B220F5C;
	Sun, 12 Oct 2025 07:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BdmKOPcL"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F4A21FF30
	for <linux-doc@vger.kernel.org>; Sun, 12 Oct 2025 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760253990; cv=none; b=YyuEHE73xLQAkGi7cmHuviXPdjmdZ6xdbRdBE9sxfXBVdmUYPqFX0rRmRNp1FGiKcD/LVl0f0nZFUmM4im5cbdyWGXwV1XKPjMUGYqVeuJHBLSrjSrTmkFCavVd1cHKEILmMXLF9eM8/ayNeX0X+jvU3tPTq7ayg3dxmksuuwac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760253990; c=relaxed/simple;
	bh=UEv2x/Lmp84MhY9spkwvdA5qI6xvme3Kk+89d41lEWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFq6y6sWksPwKlbdizI3ZEYdiU3WpE/OPAwco4goubCPomd1OTQyJ9ij7n7d67MNlXzbbmln/FfK00U1eYrO6V76KF5sQrNI80b18SAgNQp+nOOAvM5C5FukUxh0JiTipfV5sRwf9L/OmeehIzqpr6EuyPFc/uhuOztWXe4Fc1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BdmKOPcL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760253988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mg3HCPvWm6jwVlci7BHs0yCEk+Zd1iOvD/o3EJNM9JE=;
	b=BdmKOPcLGmHQBCuih3yJFx7ptznKkA1R7ar72zjy/HdeU79B4j3gBOG4qmW1b2cZ9yQjGO
	1k44Qsh750Ox2XutuhHIGl8sj//CN9znl0zcIjsEGRVHc2S6ZfzeWRUwpNjQZEzhx9FheX
	j9TmfmDgkoECLvNBBxPAcLsqrwnoJpA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-8ORTkssINECoS9Ju2SXoMQ-1; Sun, 12 Oct 2025 03:26:26 -0400
X-MC-Unique: 8ORTkssINECoS9Ju2SXoMQ-1
X-Mimecast-MFC-AGG-ID: 8ORTkssINECoS9Ju2SXoMQ_1760253985
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e41c32209so17782615e9.0
        for <linux-doc@vger.kernel.org>; Sun, 12 Oct 2025 00:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760253985; x=1760858785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mg3HCPvWm6jwVlci7BHs0yCEk+Zd1iOvD/o3EJNM9JE=;
        b=ZFV0z7H9H8t7mMSyUFGEgIble0EgI8D7P7sa1DivWRslCDQrjrwd6EqKkhxctD2MGA
         jt2G696/BZvZ5a4J04Ezfv4/Q0SqEzD4acbVccXiQ2BnvVqSiYZP2tIpr5lkZStcW8jy
         flmY3nuL6BihpCJWGrD/zs1g3AySey0uuFU2xof+xtPGe4ak3Dx0IC8efEzFZhyPm+mU
         y8mkKZh6hihxhD2V3QWfQW8xN5dGKIG2dzaI3jpPMzAyU7bWwnHi7RYo2bGQvE1HL2F2
         WhkIW5IBz8HXo8svhcxQojbUi/SQUcBo2/ER8sKmddujvPlFTkn1wsPdMviBkNm1oAoG
         SWSg==
X-Forwarded-Encrypted: i=1; AJvYcCW86SdhNGtdQA9YgOMi+bjP690Rc7uKMrNwvS5s6gt3829t1rLbvFQeJO3xFPkBYZleHQTFnv8fNRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXqff0iM+yvJpxiHSZZmvk0bGgfB+qbZ9ow3VPrHHwXezoIOZz
	h6CSncPN4348ZO7tW2GoG62o7qAOXpO0ZxYNu3V8OWGhpEHQv93okftf4D6dMcUrJ78sEy884jy
	MJh1BeD6Hdndi+AqTGXUJx0DY6TaALqPB3kOWym0Tn6NE3FgoySRu8yTeTf3iqw==
X-Gm-Gg: ASbGncvhtNiDuQnsxTc/JQHfXDOdfRkWVoCkU2BLYBI7vqdEeFd1Pz9BcWedspG5bi4
	b9Ro3On3WMBjFqqigHAhNqDR/UM1i3uIDISqjzm9blk/HiaJQXI4V+Tu0QX10tfc3Th9GNXtMZ4
	9gJS0OuDwm365y4K6jSPB0Zrh6uO4AO3fi32jTo5H8inOgZRU9vYUnrE0iN2q49qcD/S0WLF7Di
	gdngv9ptjDBG1GW/bi1vCMOnejjCFZeF4QWvKiIlxIpPFTuZnBgQ+ARPgyAI4fi4ACJTbP97+q8
	5YAQBJ7t5wHrI1t4VpleKBqrg/USni4sWQ==
X-Received: by 2002:a05:600c:1c96:b0:46f:c0c9:6961 with SMTP id 5b1f17b1804b1-46fc0e7f6e7mr21553985e9.14.1760253985222;
        Sun, 12 Oct 2025 00:26:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3gaXMtNNYza81JdpwSjq/QqGvQLh5iun4C2wC9jv6BcMxYyPNrpdbHApBSwlfgxaXbiFriA==
X-Received: by 2002:a05:600c:1c96:b0:46f:c0c9:6961 with SMTP id 5b1f17b1804b1-46fc0e7f6e7mr21553775e9.14.1760253984757;
        Sun, 12 Oct 2025 00:26:24 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb483bcf9sm127107785e9.6.2025.10.12.00.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 00:26:24 -0700 (PDT)
Date: Sun, 12 Oct 2025 03:26:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] virtio: dwords->qwords
Message-ID: <20251012031758-mutt-send-email-mst@kernel.org>
References: <cover.1760008797.git.mst@redhat.com>
 <350d0abfaa2dcdb44678098f9119ba41166f375f.1760008798.git.mst@redhat.com>
 <26d7d26e-dd45-47bb-885b-45c6d44900bb@lunn.ch>
 <20251009093127-mutt-send-email-mst@kernel.org>
 <6ca20538-d2ab-4b73-8b1a-028f83828f3e@lunn.ch>
 <20251011134052-mutt-send-email-mst@kernel.org>
 <c4aa4304-b675-4a60-bb7e-adcf26a8694d@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4aa4304-b675-4a60-bb7e-adcf26a8694d@lunn.ch>

On Sat, Oct 11, 2025 at 08:52:18PM +0200, Andrew Lunn wrote:
> > That's not spec, that's linux driver. The spec is the source of truth.
> 
> Right, lets follow this.
> 
> I'm looking at
> 
> https://docs.oasis-open.org/virtio/virtio/v1.3/csd01/virtio-v1.3-csd01.html
> 
> Is that correct?
> 
> That document does not have a definition of word. However, what is
> interesting is section "4.2.2 MMIO Device Register Layout"
> 
> DeviceFeaturesSel 0x014
> 
> Device (host) features word selection.
> Writing to this register selects a set of 32 device feature bits accessible by reading from DeviceFeatures.
> 
> and
> 
> DriverFeaturesSel 0x024
> 
> Activated (guest) features word selection
> Writing to this register selects a set of 32 activated feature bits accessible by writing to DriverFeatures.
> 
> I would interpret this as meaning a feature word is a u32. Hence a
> DWORD is a u64, as the current code uses.
> 
> 	Andrew


Hmm indeed.
At the same time, pci transport has:

         u8 padding[2];  /* Pad to full dword. */

and i2c has:

The \field{padding} is used to pad to full dword.

both of which use dword to mean 32 bit.

This comes from PCI which also does not define word but uses it
to mean 16 bit.




I don't have the problem changing everything to some other
wording completely but "chunk" is uninformative, and
more importantly does not give a clean way to refer to
2 chunks and 4 chunks.
Similarly, if we use "word" to mean 32 bit there is n clean
way to refer to 16 bits which we use a lot.


using word as 16 bit has the advantage that you
can say byte/word/dword/qword and these do not
cause too much confusion.


So I am still inclined to align everything on pci terminology
but interested to hear what alternative you suggest.


-- 
MST



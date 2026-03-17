Return-Path: <linux-doc+bounces-79765-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFjAI2FsuWl6EgIAu9opvQ
	(envelope-from <linux-doc+bounces-79765-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 15:59:45 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F23D02AC902
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 15:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C73F317E52D
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 14:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2A63E867A;
	Tue, 17 Mar 2026 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="H9NP+HUg"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95D43E3D81;
	Tue, 17 Mar 2026 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758951; cv=none; b=qYQvyc71K+ibcZCLjWAoGmp2Lyurc7nak4emLtJ3FhIDFSNDXgiVQq07gi0rAuLd4+v6B4EvOc4azxI6KHpUGWOjUjG3ZlLEPAt+2iQMpswwqO5vz83eTGkjSZhTRSQDxTG9lB2Kitj8Usk6SjluwJ4Tkl2/APEcU0F7Wmn7OPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758951; c=relaxed/simple;
	bh=iNJs/u1TpYWfU0Qz9eQPyh9AhCbCAQ1n9YEhxTfTWls=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Njf+RdLy5DuXwKJLma6PErHI3cL/nGqTZj9CaJhHVR5IjbndC4ddMdUOVRdGrwThmZu3uWiSjgTb2EJA+bc2KwH1DzJVCiobNqekVhVVSWrEebkdKyc27SSa1My8p+DW7OmqjEOXpVg0Ks/QH3msU98eNh60QU7eJKIpLcq96jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=H9NP+HUg; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F353540C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773758950; bh=wkDfJ+MhK/Z+X+CYUG17c6gVD0tWJHWYlkOrN2nR1Gs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=H9NP+HUgQiY0qPDtNgc6P00Il3c/wcdbtrAJEhSzq5gLIUtqluRQeE1kGho5pVTQD
	 QWpbwFXg5uNOMJzokqk1Uxy3n2wAJIOya8L6Rbm0Uu3X9a+Uvr76Jn8ZLfXjuAaCAG
	 C0HNnz6EPuJARNb9sYI2gF9gKfWDLR6LX6tAB0l8C1Aq/4ZniTFy1UsM38GSZeUzp/
	 SAt957trGF8oYonOJTSGveMU6bFdjk4V9xyvQnl/nqq/YaIQ1gjCafne2+uNOE529b
	 Z9brsHhHMJyc3qepgyNEGcOEPYppiKW7Ij/1P6k6mtJ/QAaKmvDryO7TFeJxl9plv2
	 T67NB6jykCuIw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F353540C7C;
	Tue, 17 Mar 2026 14:49:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: John S <xaum.io@gmail.com>, mst@redhat.com, jasowang@redhat.com
Cc: xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
 skhan@linuxfoundation.org, virtualization@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio: document the map API in the driver writing guide
In-Reply-To: <CAAZVx999y-DvB7Dp2ekoHk6s8aqqScd2gKSY4ySGAK6NNXeH5g@mail.gmail.com>
References: <CAAZVx999y-DvB7Dp2ekoHk6s8aqqScd2gKSY4ySGAK6NNXeH5g@mail.gmail.com>
Date: Tue, 17 Mar 2026 08:49:09 -0600
Message-ID: <87wlzacxzu.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79765-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,redhat.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:dkim]
X-Rspamd-Queue-Id: F23D02AC902
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

John S <xaum.io@gmail.com> writes:

> Add a new "Buffer mapping" section to the virtio driver writing guide
> documenting the virtio map API (struct virtio_map_ops). This API was
> introduced in commit bee8c7c24b73 ("virtio: introduce map ops in virtio
> core") to allow transports and devices that do not perform DMA (such
> as VDUSE) to provide their own buffer mapping logic instead of abusing
> the DMA API.
>
> The new section explains when and why custom map ops are used, documents
> the virtio_map_ops structure and the union virtio_map token, and
> references the driver-facing mapping helpers with their kernel-doc.
>
> Signed-off-by: Kit Dallege <xaum.io@gmail.com>

So what is the story with "John S" in the From line?

Please, slow down with the AI-generated patches.  Perhaps focus on
exactly one of them, and get it to the point where it can be considered
for inclusion before doing any others?

jon


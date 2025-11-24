Return-Path: <linux-doc+bounces-67952-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E69C80C27
	for <lists+linux-doc@lfdr.de>; Mon, 24 Nov 2025 14:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2820134965E
	for <lists+linux-doc@lfdr.de>; Mon, 24 Nov 2025 13:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9DC1D5ACE;
	Mon, 24 Nov 2025 13:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="orMoP09g"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-m19731101.qiye.163.com (mail-m19731101.qiye.163.com [220.197.31.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322061C8631
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 13:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763990730; cv=none; b=ILyeRbiNOUzVNnlDp6EX417rYu/bp3hoQOOAsI6AoPT84IDXBEQYtQeiy/vNlbwSaY1FN/0iaX/6z2YZPtfmdSOWwMlM5hrkqHzim9Drd3F7BQqoITXPDx4SAV+gGalGx0qGwKjV+5pxnX17NnLfaYtm2BsQYgVo4/EfCU2EPSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763990730; c=relaxed/simple;
	bh=UESgh4Fdkxma88x4rOmbveW+yKIHgEfgVZjbpcUsvXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=onkP9yED/Enz4k5dlYL6SZWRHuMv4oU0UCxIsH+3R/hKLgtZnqbuuXiwe0i09XB7gAwgfkrANN4J5zwTz+Euzjj2FiHk1H6QnZ5N6FTm5PTbWP6XDkwhmdwxIe4olT7yf4fx2QSjHN0A7pYuPrfkGnUKKE9So0j4PFZxUxOGHgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=orMoP09g; arc=none smtp.client-ip=220.197.31.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from server001 (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ab29af84;
	Mon, 24 Nov 2025 21:25:16 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: corbet@lwn.net
Cc: alexs@kernel.org,
	baikefan@leap-io-kernel.com,
	dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	si.yanteng@linux.dev
Subject: Re: [PATCH v2 01/25] docs/zh_CN: Add index.rst translation
Date: Mon, 24 Nov 2025 21:25:47 +0800
Message-ID: <20251124132548.36836-1-baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <874iqksqs2.fsf@trenco.lwn.net>
References: <874iqksqs2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ab60a3cd109d5kunm4a1f4c3b36908e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHh5MVhpNTklJGk9KGkoZTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktISk5MSVVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=orMoP09genSx1b9ui7hlIjlNSkpSKD2cQF7AG4d7oMEts7wvwB9Xx2B81xXE2Qzm1c2CO75rBLWfWMZmoYVw5jqaRXpUAR6xMpBhmhikdBauCsGmGxtN3MK5I0Ep3nADt7lBTBv5elmavkzWiH8bUq0djA0x5GAhF92FNLxsgDEdrMVpx50Or5Ob9HyCknxAZhsZ49Q/Wgziho8zbMHgsS2GjKT5aldlmKUXXYKY/2lPl+XpAJY9+2rIE9IVUgrdElfOL2k6WzmFNAaqkFIZNsfqM4eC2doLLBVVTEhxWa0+dxzrt1YysZ2lzOmjfmpiwaijeP4cYwvwBVlYJ9+2Qw==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=UESgh4Fdkxma88x4rOmbveW+yKIHgEfgVZjbpcUsvXc=;
	h=date:mime-version:subject:message-id:from;

Hi Jonathan,

Thanks for your review.

I've updated the signoff to include my full legal name.

All translations were done manually.
To improve submission and review efficiency, the number of translation documents
in this series has been reduced to 8 in v3 patch series.

Thanks,
BaiKefan

On Sun, Nov 23, 2025 at 08:38:21AM -0700, Jonathan Corbet wrote:
> macrofun <baikefan@leap-io-kernel.com> writes:
>
> > Translate .../usb/index.rst into Chinese and update subsystem-apis.rst
> >
> > Update the translation through commit c26cee817f8b
> > ("usb: gadget: f_fs: add capability for dfu functional descriptor")
> >
> > Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
>
> Please use your real, legal name in the signoff line.
>
> Out of curiosity, are these translations machine-generated?
>
> Thanks,
>
> jon


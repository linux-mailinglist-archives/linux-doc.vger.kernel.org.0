Return-Path: <linux-doc+bounces-27409-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6F699D460
	for <lists+linux-doc@lfdr.de>; Mon, 14 Oct 2024 18:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2021B28A052
	for <lists+linux-doc@lfdr.de>; Mon, 14 Oct 2024 16:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71211B4F14;
	Mon, 14 Oct 2024 16:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Ea9VBbZ7"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120EC1ADFE4;
	Mon, 14 Oct 2024 16:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728922307; cv=none; b=nUxLWZ1/BEUl9236Dc/9zI9xTUq6vKA17jkV4V290FZMk3ixWpP4hCkaxtmbioh9OF/MAE4nIZBjKh/02Vj69M1SsDCAvlR/f8wasP2TQ4DKXm/bNcAzJ6rDb4QkADhIRT7itV/hTlemhleUeRhre2HOFCFq/377DLBRTvmfohY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728922307; c=relaxed/simple;
	bh=8AsRiQk5WbcLVJQ9hEC2I0pGZiE5ng8TGGNdzs2iDqI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ul12n/Hd+s2ICuVMHnNTs4PHifrkSG2n6C/fCIC/d7JXwDcdrtOUxufajSRRoTXuxgPHrXrXG57WP/EZrVQFutGbfxsQujNH58iylqTU65EMr92Jz7DOWy/FSk72+LU+e1TwWcg9Ye30ykpBKUVh4l8OEhypatatdwMiulcDEIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Ea9VBbZ7; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4710942BFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1728922305; bh=14ZLNAkNt02rXGIOEHQPxap1SVZBcEXbEk3p2cseQdo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ea9VBbZ7xiYjkGBShjl+NHG4YJJyTPelCt72uEQ3YWTE3k+VXSjiUKpNK2N6KHReR
	 uM2MgsL7muQzhWVuyjqyJLludBOz9rVVWIwWYXVg6yMFzSFXw9GUdouJ2ffjxYgPTK
	 aVjtm+wEYgLJJYp8F4zWKdOLqWK618GUAD9kT5+Msgh9ItgqHLcHI6wj10JLxOrLEQ
	 7lgmkRzXIe0a6XW+Gx5l906Jn5pU+Oq3Ekyt0TIejsQnakLN2C+UgRKSbDpKBU3YyA
	 aYtLXLKhVS0mT9A/UtA91fmBpTytRSvGP2ofgadYURqi/WaxVgcwlrAc+t5RLw0Mtf
	 2KXl/3Ck7dqcA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4710942BFE;
	Mon, 14 Oct 2024 16:11:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>, Yanteng
 Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Cc: hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: add the translation of kbuild/kconfig.rst
In-Reply-To: <20241005144121.3953919-1-dzm91@hust.edu.cn>
References: <20241005144121.3953919-1-dzm91@hust.edu.cn>
Date: Mon, 14 Oct 2024 10:11:44 -0600
Message-ID: <87v7xuslz3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dongliang Mu <dzm91@hust.edu.cn> writes:

> Finish the translation of kbuild/kconfig.rst and move kconfig
> from TODO to the main body.
>
> Update to commit f6314b76d826 ("docs: kbuild/kconfig: reformat/cleanup")
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>  .../translations/zh_CN/kbuild/index.rst       |   2 +-
>  .../translations/zh_CN/kbuild/kconfig.rst     | 259 ++++++++++++++++++
>  2 files changed, 260 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/kbuild/kconfig.rst

Applied, thanks.

jon


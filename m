Return-Path: <linux-doc+bounces-39931-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B399A4E65A
	for <lists+linux-doc@lfdr.de>; Tue,  4 Mar 2025 17:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C15B88A13DB
	for <lists+linux-doc@lfdr.de>; Tue,  4 Mar 2025 16:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66343293B49;
	Tue,  4 Mar 2025 15:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="OaaF8P9l"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB2C27FE85
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 15:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741103055; cv=none; b=mt2j17mNms4/+BSAjtnjViYRYzFqC9px14K3YLnlAG3JQRA9YW5nF4n9KMU/IVBnuXkt2nXFAwL37fyhqSbgcUSkQil+Scx90GY4Z6yXnIlsqcRbdcP2jI91Z1dqa4T7z4ToCBv/v/KCmid4bP9qH97RAf3Pn60z7c9IWOZsMMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741103055; c=relaxed/simple;
	bh=H1uFCvpPgRr1esKl4dUZSMjnZtXAE08ZBJ6LDU4a1Lg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U++pDS4d91VT7ehtajdkejspUbm9gVBmPz7LqPQTU/W5Fuuw6Mu632nBrULgekOStvU0BIiqlZDqmx/gY0pksvFkK9KeAyTq25pnWK9/vWjqI2QyJE2LtXewtfJ0+0QlMF80niTrKk7Yjes8bSuCA1hFrSz4jlI1pYPDspl/GfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=OaaF8P9l; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 96ED441064
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1741103052; bh=/EyxoGEsGZqh6yuQEzbrx8UwYVaiwH+yo4JDwrLliJ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OaaF8P9lMJqjM/sfBeAjlOqUBuS0z5wEiKpfBxd9OHR0M34woh05yfrDs80zSPhnh
	 iECIj1HKIyXddUfjvgCGp5DZK8AQdgarTj8fnUk4/7iX8eQvh1L+TFQXBNAWQEo3++
	 n6uh22dB1GHoOTQWY5EwqGicb0EKHpYgw1faqXj3oxei2M+c2Kb9vpa5EublwSgpQ/
	 d6uB+UMiXQBotHvJawd74QlXpNNiyLLj0FbqWBApjFIgleqDnQpehBNiqhcoSqMp4W
	 fflnKVEuNaKC1qK7VAgKR40JUmYp49p8BRdkmfhzzWV9/94wj8iWQmmOE8CtvvxJnK
	 RsObtWIg6KFJQ==
Received: from localhost (unknown [73.243.92.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 96ED441064;
	Tue,  4 Mar 2025 15:44:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Joshua Rose <joshuarose@gmx.com>, linux@leemhuis.info
Cc: linux-doc@vger.kernel.org
Subject: Re: Grammar issue(s) in documentation
In-Reply-To: <Z8Y-FHZ5tYBEMy4j@spinny>
References: <Z8Y-FHZ5tYBEMy4j@spinny>
Date: Tue, 04 Mar 2025 08:44:11 -0700
Message-ID: <87ikooer78.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Joshua Rose <joshuarose@gmx.com> writes:

> Hi all,
>
> I just wanted to briefly point out that as a native English speaker I
> found the following text significantly hard to read.
>
> "Do not worry installing your kernel manually and thus bypassing your
> distribution=E2=80=99s packaging system will totally mess up your machine=
: all
> parts of your kernel are easy to remove later, as files are stored in
> two places only and normally identifiable by the kernel=E2=80=99s release
> name."[1]
>
> I found this very hard to read. I would probably re-phrase this as
> follows, but I'd be completely open - and in fact encourage - any
> suggestions on the rephrasing of the excerpt.
>
> "Do not attempt to circumvent your distribution's packaging system by
> installing your kernel manually; this will likely break your machine.
> Components of your kernel can be selectively removed later on.  Such
> components (files) are stored in two locations, both identifiable
> by the kernel's release name."

I think you have completely reversed the meaning of that text - which
perhaps indicates that it is indeed in need of improvement :)

> As an additional note, I'm looking for any recommendations on a good
> resource on the maintenance of the Documentation/ directory.

Documentation/doc-guide/ would be the place to look. Do you have
specific questions?

Thanks,

jon


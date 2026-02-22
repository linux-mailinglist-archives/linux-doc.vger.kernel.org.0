Return-Path: <linux-doc+bounces-76496-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP0aGCc+m2m8wgMAu9opvQ
	(envelope-from <linux-doc+bounces-76496-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 22 Feb 2026 18:34:31 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9796216FF12
	for <lists+linux-doc@lfdr.de>; Sun, 22 Feb 2026 18:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D877A300B9DA
	for <lists+linux-doc@lfdr.de>; Sun, 22 Feb 2026 17:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965DA3587A2;
	Sun, 22 Feb 2026 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HlUM4zMr"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7258F79CD;
	Sun, 22 Feb 2026 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771781656; cv=none; b=WqdkJwtQmmqhvifGG357+6IcP2gOXtDDzijO5nhOs4MORhFlnCkwz1pNw1RlbHwvPMeW4qU7X5JTv7wmZKalYwB95m3BMqK4aRiDQPMusnOLLWZtC3SqSzQfqrg+YCzBgg6Sz8EkdM5veiPyjaIKXekZIPd7ClLUki/qRpWbEqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771781656; c=relaxed/simple;
	bh=dYOBNdY0v4S4fU2WtKLYLXnXpIPdZZvZ1H5+4Ue4jYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AF8/OBtSlZ1u7Tq+57B9bIUe0QV600/4fO3Wuaep2EWzGDFXO5HScybcp5p8CqndfeJK5KX5xQ2Yx46nJKver42WlrEejMbaf6Ka3Fn13/mHf1/A1XchuflY6O2vEPMLgOUfrq4zJNDwc767vgCd/KyxBHieqwy+Ow3Z9Mv8t2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HlUM4zMr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05ADFC116D0;
	Sun, 22 Feb 2026 17:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771781656;
	bh=dYOBNdY0v4S4fU2WtKLYLXnXpIPdZZvZ1H5+4Ue4jYQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HlUM4zMrHGW+KBz1amuZ2aGa9TnPuGCg8umAA29plijf/lemoNTvzSay5QPhL8AaB
	 XnqDw7qRV42Wu0+YxC4OaAGCgmdN2HMiXvFacYUcGp9pZKdP6zr6iIzzROkCa7Mseh
	 0G+fM/gM/2fMkp68Wo431e7YVlnjoTga0Z+D1jV5PJVPCC3W9wCuMboKUBIlsKEWQC
	 8oaXquk8+z2j3XBUSiDvHeUynGv11+O9nkTQicEnqP5lLwaEmr9DMAcUM2TEhWrHFO
	 F0ICJeozcWXLBMobP+OFMQDlOGsnXNPopLIwblBBZw1oKyXUKvIoFU5Z/lCEH3/6C/
	 Lj+Cfy69b/tKA==
Date: Sun, 22 Feb 2026 17:34:05 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v7 3/8] iio: test: add kunit test for fixed-point
 parsing
Message-ID: <20260222173405.15d57663@jic23-huawei>
In-Reply-To: <20260216-adf41513-iio-driver-v7-3-b0ed387ab559@analog.com>
References: <20260216-adf41513-iio-driver-v7-0-b0ed387ab559@analog.com>
	<20260216-adf41513-iio-driver-v7-3-b0ed387ab559@analog.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-76496-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,rodrigo.alencar.analog.com,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,analog.com:url,analog.com:email,intel.com:email]
X-Rspamd-Queue-Id: 9796216FF12
X-Rspamd-Action: no action

On Mon, 16 Feb 2026 15:02:18 +0000
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Add kunit test cases that aims to verify expected behavior for
> iio_str_to_fixpoint() and iio_str_to_fixpoint64().
> To run the test, create a .kunitconfig file with:
> 
> CONFIG_KUNIT=y
> CONFIG_IIO=y
> CONFIG_IIO_FIXPOINT_PARSE_KUNIT_TEST=y
> 
> and run the command:
> ./tools/testing/kunit/kunit.py run --kunitconfig=.kunitconfig
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> ---
>  MAINTAINERS                                |   1 +
>  drivers/iio/test/Kconfig                   |  12 +
>  drivers/iio/test/Makefile                  |   1 +
>  drivers/iio/test/iio-test-fixpoint-parse.c | 470 +++++++++++++++++++++++++++++
>  4 files changed, 484 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1bf39f6d964e..a0d845117b52 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1640,6 +1640,7 @@ L:	linux-iio@vger.kernel.org
>  S:	Supported
>  W:	https://ez.analog.com/linux-software-drivers
>  F:	Documentation/devicetree/bindings/iio/frequency/adi,adf41513.yaml
> +F:	drivers/iio/test/iio-test-fixpoint-parse.c

This doesn't have any much to do with the adf41513, that's just one user
of the code being tested.

Hence this needs it's own MAINTAINERS entry.

Other than that, looks excellent to me.  Thanks for adding these!

Jonathan

> 



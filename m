Return-Path: <linux-doc+bounces-67480-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 06690C73019
	for <lists+linux-doc@lfdr.de>; Thu, 20 Nov 2025 10:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6375C3489E8
	for <lists+linux-doc@lfdr.de>; Thu, 20 Nov 2025 09:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16B7266B67;
	Thu, 20 Nov 2025 09:04:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371B912FF69
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 09:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629458; cv=none; b=Pw5/GLhKhcJuRPnaNuLVXRR6bEauCDtrO/7HSMQO3Bi4TLW0YryCbe4OE3pAHN+tMTcBkp5lMGqWwuXnoqiQuhJS0inA5PbEkwyHQqY/BZrUKdYhCPi5cT42ONi1VdESdMucKb+8qW0FE4JO/hQEnC2UYJDFawwDi9gfsS3Z3sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629458; c=relaxed/simple;
	bh=lsmaDOwMB77KFC623RGQJxY2MpDV9vfHvihfBRigJM0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cJObssEgRU/2mTKreral3b9m7i1ScUtXYPn50kkT118xbPAlJUUqHOoHFZ96IhLILmblaXgoA+JYxp0Xjni8s6MLVmHssNuCKX5z0yMam6/I4BXiU3sJ0ODf9XgCGpGwLPwhDSTgASRZ8VWSXw9mEov5SMCv8SZtwValXhUvg9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vM0aK-0005MP-PD; Thu, 20 Nov 2025 10:04:12 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vM0aJ-001O9v-0g;
	Thu, 20 Nov 2025 10:04:11 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vM0aJ-000000002wU-0et6;
	Thu, 20 Nov 2025 10:04:11 +0100
Message-ID: <cc5a25cedf2809d02430841a282865b1d1f5aa23.camel@pengutronix.de>
Subject: Re: [PATCH -next] Documentation: reset: Remove
 reset_controller_add_lookup()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yue Haibing <yuehaibing@huawei.com>, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 20 Nov 2025 10:04:11 +0100
In-Reply-To: <20251114020531.94262-1-yuehaibing@huawei.com>
References: <20251114020531.94262-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Fr, 2025-11-14 at 10:05 +0800, Yue Haibing wrote:
> Commit 205b261463ff ("reset: remove legacy reset lookup code") removed th=
is
> api, so update the document.
>=20
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  Documentation/driver-api/reset.rst | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/driver-api/reset.rst b/Documentation/driver-ap=
i/reset.rst
> index 84e03d7039cc..f773100daaa4 100644
> --- a/Documentation/driver-api/reset.rst
> +++ b/Documentation/driver-api/reset.rst
> @@ -218,4 +218,3 @@ devm_reset_controller_register().
>                 reset_controller_register
>                 reset_controller_unregister
>                 devm_reset_controller_register
> -               reset_controller_add_lookup

Applied to reset/next, thanks!

[1/1] Documentation: reset: Remove reset_controller_add_lookup()
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D1387cb78f101

regards
Philipp


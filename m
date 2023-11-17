Return-Path: <linux-doc+bounces-2569-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A38ED7EF829
	for <lists+linux-doc@lfdr.de>; Fri, 17 Nov 2023 21:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D52DA1C203B9
	for <lists+linux-doc@lfdr.de>; Fri, 17 Nov 2023 20:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D6437160;
	Fri, 17 Nov 2023 20:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="tMjZQEE5"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D80D75;
	Fri, 17 Nov 2023 12:09:35 -0800 (PST)
Received: from localhost (unknown [98.53.138.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B297044A;
	Fri, 17 Nov 2023 20:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B297044A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1700251774; bh=XDY+wGPvrcfTDlV+CkWycIiMf+luuMERPm1C/YmRvB8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tMjZQEE5LwZ5PqHZpRtwmOC9+Lx0ucGWa/v6i/cYeA0XBjrJhvha+EwFKTSrpDjTQ
	 OLywCBL8Uqg5PG6VwLI0/yiYxcBO+AD02x4FehBvrUjFEgHyOj2jWGmSGFVdd3SvD2
	 /vQPCAdtvkpejJc7jGRqd3IkSad1qgOi0YSuS4nLJgAFAJIxdwoVoofFGyb6fE/ND7
	 NaJFI50VEZL9mK1403oilWnAigF5WTAYF+mf/7C7xdmplAwFD0xuYc4ViLZ0/TMDYd
	 LKt2IZJduu5svyNli+8jsBahqWv59hniHnuMI9F8QgVXaxB1BnATCEEdcEW7fhxpH+
	 Ul0TcoVUHpMeQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>, linux-doc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org,
 Vegard Nossum <vegard.nossum@oracle.com>, Alex Shi <alexs@kernel.org>,
 Armin Wolf <W_Armin@gmx.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Fangrui Song <maskray@google.com>, Federico Vaga
 <federico.vaga@vaga.pv.it>, gaochao <gaochao49@huawei.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede
 <hdegoede@redhat.com>, Hu Haowen <src.res.211@gmail.com>, Iwona Winiarska
 <iwona.winiarska@intel.com>, Julien Panis <jpanis@baylibre.com>, Ricardo
 =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>, Richard Cochran
 <richardcochran@gmail.com>, Rui Li <me@lirui.org>, SeongJae Park
 <sj@kernel.org>, Stephan Mueller <smueller@chronox.de>, Tomas Winkler
 <tomas.winkler@intel.com>, Wan Jiabing <wanjiabing@vivo.com>, Wu
 XiangCheng <bobwxc@email.cn>, Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH RFC 00/11] use toctree :caption: for ToC headings
In-Reply-To: <20231027081830.195056-1-vegard.nossum@oracle.com>
References: <20231027081830.195056-1-vegard.nossum@oracle.com>
Date: Fri, 17 Nov 2023 13:09:24 -0700
Message-ID: <87ttpk87m3.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> Hi,
>
> This patch series replaces some instances of 'class:: toc-title' with
> toctree's :caption: attribute, see the last patch in the series for
> some more rationale/explanation.
>
> There are some dependencies here: the first patch is necessary for the
> headings in following patches to be styled correctly with the alabaster
> theme (rtd_sphinx already has it), and the last patch depends on most
> of the previous patches to not use the old .toc-title class anymore.
>
> Assuming people agree with the general direction, I thought maybe the
> easiest thing would be to collect maintainer acks in this round and
> then for me to resubmit everything to the documentation tree/maintainer
> in one go.

Easiest thing seems to be for me to just apply it, so I've done that.
It would have been a bit easier if you'd worked against a recent
docs-next, but so it goes...

Thanks,

jon


Return-Path: <linux-doc+bounces-1289-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2352D7D9199
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 10:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC19E282295
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 08:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BDA2156EB;
	Fri, 27 Oct 2023 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Snl03ME5"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D06F156DC
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 08:32:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15EFBFA;
	Fri, 27 Oct 2023 01:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698395544; x=1729931544;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=j5JdL0JhDPE1qf2jcF+jt7NERWD/QscJA3GN/POMpvg=;
  b=Snl03ME5osuqFkjpdpAa0qOpwFfA4zpHv8RnIDYwpV+oZnsYmug29vDl
   Loc0/QxJ9P7T/nAc+jkVYmVXmWu6WajAAOncMHLDlRmGnJM86htZFX5Mc
   41HiXfzWv3wYzQjYFyJFlWarhpOV1EexBgdy4KH3z2Xwy1Y2PimvZN+6c
   hbGQgYarxkkeqC1YY8AhSNHc23oh+zxeSmKyeRYdybvQrDaGBy2Vs5e1V
   AQgZaTdDpUcifVkrnUT6FzLssoj8YxCoTiUHW5Ry52tNxPWoSupsgSupw
   Zm4094omwwgCTBgrRiJXiBhUqQEwoqiZDsfsrXCDI13Ww+Kv5y1jTNUtD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="367078434"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="367078434"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 01:32:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="738231"
Received: from jhajducz-mobl.ger.corp.intel.com (HELO localhost) ([10.252.34.19])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 01:31:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Vegard Nossum <vegard.nossum@oracle.com>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>,
 Alex Shi <alexs@kernel.org>, Armin Wolf <W_Armin@gmx.de>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Fangrui Song <maskray@google.com>, Federico
 Vaga <federico.vaga@vaga.pv.it>, gaochao <gaochao49@huawei.com>, Greg
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
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231027081830.195056-1-vegard.nossum@oracle.com>
Date: Fri, 27 Oct 2023 11:32:12 +0300
Message-ID: <874jic79f7.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 27 Oct 2023, Vegard Nossum <vegard.nossum@oracle.com> wrote:
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

Patch 1 is a matter of taste, I guess. I'll leave it to Jon.

Everything else LGTM.

For the benefit of others, the toctree directive gained the "caption"
option in Sphinx 1.3 [1].

BR,
Jani.


[1] https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html


>
>
> Vegard
>
> ---
>
> Vegard Nossum (11):
>   docs: style toctree captions as headings
>   doc: userspace-api: properly format ToC headings
>   media: admin-guide: properly format ToC heading
>   crypto: doc: properly format ToC headings
>   Documentation: dev-tools: properly format ToC headingss
>   docs: driver-api: properly format ToC headings
>   input: docs: properly format ToC headings
>   doc: misc-device: properly format ToC heading
>   media: doc: properly format ToC headings
>   docs: use toctree :caption: and move introduction
>   docs: remove .toc-title class
>
>  Documentation/admin-guide/media/index.rst     | 10 +---------
>  Documentation/crypto/api.rst                  |  5 +----
>  Documentation/crypto/index.rst                |  5 +----
>  Documentation/dev-tools/index.rst             |  5 +----
>  Documentation/driver-api/index.rst            |  5 +----
>  Documentation/driver-api/media/index.rst      |  7 +------
>  Documentation/driver-api/mei/index.rst        |  7 +------
>  Documentation/driver-api/pci/index.rst        |  5 +----
>  Documentation/input/input_kapi.rst            |  5 +----
>  Documentation/input/input_uapi.rst            |  5 +----
>  Documentation/input/joydev/index.rst          |  5 +----
>  Documentation/misc-devices/index.rst          |  5 +----
>  Documentation/process/development-process.rst | 19 +++++++++----------
>  Documentation/sphinx-static/custom.css        |  3 +++
>  .../sphinx-static/theme_overrides.css         |  5 -----
>  .../it_IT/process/development-process.rst     | 19 +++++++++----------
>  .../translations/zh_CN/dev-tools/index.rst    |  5 +----
>  .../zh_CN/driver-api/gpio/index.rst           |  3 +--
>  .../translations/zh_CN/driver-api/index.rst   |  5 +----
>  .../zh_CN/process/development-process.rst     |  5 ++---
>  .../zh_CN/userspace-api/index.rst             |  5 +----
>  .../zh_TW/process/development-process.rst     |  5 ++---
>  Documentation/userspace-api/index.rst         |  5 +----
>  .../userspace-api/media/cec/cec-api.rst       |  7 +------
>  .../userspace-api/media/drivers/index.rst     |  7 +------
>  .../userspace-api/media/dvb/dvbapi.rst        |  7 +------
>  Documentation/userspace-api/media/index.rst   |  7 +------
>  .../media/mediactl/media-controller.rst       |  7 +------
>  .../media/rc/remote_controllers.rst           |  7 +------
>  .../userspace-api/media/v4l/v4l2.rst          |  7 +------
>  30 files changed, 49 insertions(+), 148 deletions(-)

-- 
Jani Nikula, Intel


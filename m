Return-Path: <linux-doc+bounces-2618-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1402D7F071B
	for <lists+linux-doc@lfdr.de>; Sun, 19 Nov 2023 16:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D677B208B3
	for <lists+linux-doc@lfdr.de>; Sun, 19 Nov 2023 15:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE9611CB4;
	Sun, 19 Nov 2023 15:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236C6C2;
	Sun, 19 Nov 2023 07:16:50 -0800 (PST)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5842a7fdc61so1889551eaf.3;
        Sun, 19 Nov 2023 07:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700407009; x=1701011809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWEPk/3aAzX0I4fI4cuUC5y57V6oWUlKYqFVGCjXpJ4=;
        b=jYdkgTQCJNpcIhYxrTjCuVXxg8j7bDaurJU0xschcM427IQCk8a5CGBzwTgHG+vSsJ
         yyptBjjQJMihbcnTi0hgl9sIOPahzvofD2ZkmYnKCtdySFtWmyUx9InMhPnMtF744uWq
         0SAtEr+gkYEBq0yG56Rt/61GE9ywlWqfxXdzbzWZ23DoePqulNHbZqe9VG2A794Jp61p
         OFeX4f9S+V69LIbCVku0o/PW15w2zg9k/LFmPsjJioL7Zd6gxFZ8J7njqP/GnhF8A0DQ
         432+1/gx8D9DEsqygWJ3AsnPFa7ZtRbzxOtsuvEKRnM9BgZCvUgCEflU+gUEr7RXmDdj
         OqRw==
X-Gm-Message-State: AOJu0Yz5Rcr/gEWmrXFGpUyknY38xrNNArWpSn3sh+4Z/4Zw5RWkRGbv
	4Q83zngXKrpTddJzk2VD8Q==
X-Google-Smtp-Source: AGHT+IFTumx8nyQQh6n2laOF1YkhSXqTh5bw2xAJK/w4wHOJAQlPpzBcTyUNnWCP6irMM3KxJR5Kug==
X-Received: by 2002:a05:6820:1c84:b0:56c:cd0c:1d67 with SMTP id ct4-20020a0568201c8400b0056ccd0c1d67mr5808089oob.7.1700407009353;
        Sun, 19 Nov 2023 07:16:49 -0800 (PST)
Received: from herring.priv ([2607:fb90:45e3:889f:15b4:1348:6d64:224b])
        by smtp.gmail.com with ESMTPSA id w18-20020a4ae4d2000000b00581fc1af0a7sm1065154oov.28.2023.11.19.07.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 07:16:48 -0800 (PST)
Received: (nullmailer pid 215792 invoked by uid 1000);
	Sun, 19 Nov 2023 15:16:43 -0000
Date: Sun, 19 Nov 2023 09:16:43 -0600
From: Rob Herring <robh@kernel.org>
To: Yi-De Wu <yi-de.wu@mediatek.com>
Cc: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang <ze-yu.wang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, David Bradil <dbrazdil@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, Jade Shih <jades.shih@mediatek.com>, Ivan Tseng <ivan.tseng@mediatek.com>, My Chuang <my.chuang@mediatek.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>, PeiLun Suei <peilun.suei@mediatek.com>, Liju Chen <liju-clr.chen@mediatek.com>, Willix Yeh <chi-shen.yeh@mediatek.com>, Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Subject: Re: [PATCH v7 02/16] dt-bindings: hypervisor: Add MediaTek GenieZone
 hypervisor
Message-ID: <20231119151643.GA213170-robh@kernel.org>
References: <20231116152756.4250-1-yi-de.wu@mediatek.com>
 <20231116152756.4250-3-yi-de.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116152756.4250-3-yi-de.wu@mediatek.com>

On Thu, Nov 16, 2023 at 11:27:42PM +0800, Yi-De Wu wrote:
> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
> 
> Add documentation for GenieZone(gzvm) node. This node informs gzvm
> driver to start probing if geniezone hypervisor is available and
> able to do virtual machine operations.
> 
> [Detail]
> The debate of using dt or not remains intact, and gentle ping seems not
> working on this issue. We'll keep this patch for further discussion and
> move forward in order to rebase based on the latest rc release. For
> previous discussion, please kindly refer to the following link.

Please explain in the commit message why this needs to be in DT and is 
not discoverable by some other means?

Rob


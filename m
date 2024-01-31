Return-Path: <linux-doc+bounces-8004-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB908439D6
	for <lists+linux-doc@lfdr.de>; Wed, 31 Jan 2024 09:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E56FDB299ED
	for <lists+linux-doc@lfdr.de>; Wed, 31 Jan 2024 08:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7033869D3B;
	Wed, 31 Jan 2024 08:48:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from sgoci-sdnproxy-4.icoremail.net (sgoci-sdnproxy-4.icoremail.net [129.150.39.64])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B4260884
	for <linux-doc@vger.kernel.org>; Wed, 31 Jan 2024 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.150.39.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706690881; cv=none; b=eBY0vS7CTZwXfXHNBx27ip1D9G6RQWJ1oJi8tpcsYn22+3cDue13XZtohMqrjj56h2kRNSbLqpYfuj0FtUVghQ1dp2+S4eQaMbxsgIxBNssgMLbjvlvQNaWsCkgtydIbjwSdJsqnulvxrm5m5vVpoVqV+u5FSGpEVaPco2P+xwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706690881; c=relaxed/simple;
	bh=FlqU985KR9iu85vhCvmIs7G5Qt86JQn0JCNOXOteauw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cco7KqVdpcrkVfImQndvRrCl/RtnbqM6zeOpjTcrVubC8GcHilbBiDTQCj8ERD4DANQPbSm+jbIrEobit01qOkK2GvOAoHk3fzevymjgOZM7ndW29D6pp8pEKy95Aw/CMvuDr5GPttKVOOae+isWg93yVk47AlItt2Ra0aEUYVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytium.com.cn; spf=pass smtp.mailfrom=phytium.com.cn; arc=none smtp.client-ip=129.150.39.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytium.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytium.com.cn
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwBHaXA0Cbpljw_oBw--.18192S2;
	Wed, 31 Jan 2024 16:47:48 +0800 (CST)
Received: from phytium.com.cn (unknown [218.76.62.144])
	by mail (Coremail) with SMTP id AQAAfwA3I2kxCbplD2UCAA--.1582S3;
	Wed, 31 Jan 2024 16:47:45 +0800 (CST)
From: Xiong Yining <xiongyining1480@phytium.com.cn>
To: rmk+kernel@armlinux.org.uk
Cc: jiahao.os@bytedance.com,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	wangyuquan1236@phytium.com.cn,
	chenbaozi@phytium.com.cn
Subject: Re:[PATCH v2 00/17] arm64 kernel text replication
Date: Wed, 31 Jan 2024 08:47:42 +0000
Message-Id: <20240131084742.2360053-1-xiongyining1480@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAfwA3I2kxCbplD2UCAA--.1582S3
X-CM-SenderInfo: x0lr0wp1lqx0bjrumio6sk53xlxphulrpou0/1tbiAQAABmW3-fcHXQAJsM
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=xiongyinin
	g1480@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU8nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Hi, Russell

>
> Kernel text replication does not give arbitary guarantees of
> improvement, so pulling figures of "gain of over 50%" is a complete
> misrepresentation - it's highly workload and platform specific.
>

Thanks for your rapid reply.

Yes, the performance is indeed strongly related to the system, I will continue 
to do more test with this patch to analyse the system performance bottlenecks.

BTW, I have mentioned "gain of over 50%" because I am interesting on your
test environment and test tools and maybe I could reproducing the experimental
scenario.

Many thanks
YiNing



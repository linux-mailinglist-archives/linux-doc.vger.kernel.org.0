Return-Path: <linux-doc+bounces-90283-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FFpO01rHWrqaAkAu9opvQ
	(envelope-from <linux-doc+bounces-90283-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 13:21:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F93B61E3D3
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 13:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AE0330360AC
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jun 2026 11:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427113A3E95;
	Mon,  1 Jun 2026 11:20:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF3839B947;
	Mon,  1 Jun 2026 11:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312836; cv=none; b=JPiGpSUvve/oupoOjVAtzu6z4oDBTsJ43WGQ4w3dLZkpDgqEsqnM1+XtkUnCseVyUjeZX6dWnx1Ut01UBoEMrCOYuiBe6S27aRfry1Lg9TSXneeaX6MgxW1vEm99Eso+pTHRWJKwgjW48z+Qm3ARXFrSCePegvINVc7GBt2KhNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312836; c=relaxed/simple;
	bh=Gxton/4wo3wXBqeRE9ui8o2fYIJTnYjXq9a+3voQdSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sJetAFV4kG0AOWHfcaGF1XpoNP+UJbUjqsQAm7FvlTBjKQyAppdOGdEgv4mZ13KwxciUcJScD9rDFzIv8Fbkb4zoN/RiPIIMvGmQfDRpV4ouqssDy3KDK+y0qt5puwFECuNzflFKEUjtZ/IiMEJo9LPeO3trBNS9C/K7pw/arPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gTWhg5c7WzKHN0w;
	Mon,  1 Jun 2026 19:20:03 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 5BB304058C;
	Mon,  1 Jun 2026 19:20:26 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.87.109])
	by APP1 (Coremail) with SMTP id cCh0CgB3ej_iah1qEvbwAA--.46998S4;
	Mon, 01 Jun 2026 19:20:24 +0800 (CST)
From: Zeng Heng <zengheng@huaweicloud.com>
To: vladimir.murzin@arm.com,
	xuwei5@huawei.com,
	wangyushan12@huawei.com,
	yangyicong@hisilicon.com,
	maz@kernel.org,
	yeoreum.yun@arm.com,
	miko.lenczewski@arm.com,
	james.clark@linaro.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	kuninori.morimoto.gx@renesas.com,
	lucaswei@google.com,
	catalin.marinas@arm.com,
	broonie@kernel.org,
	lpieralisi@kernel.org,
	thuth@redhat.com,
	kevin.brodsky@arm.com,
	tongtiangen@huawei.com,
	oupton@kernel.org,
	ryan.roberts@arm.com,
	mark.rutland@arm.com,
	will@kernel.org,
	Sascha.Bischoff@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	wangkefeng.wang@huawei.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: cpufeature: Add WORKAROUND_DISABLE_CNP capability
Date: Mon,  1 Jun 2026 19:19:58 +0800
Message-ID: <20260601112000.1145391-1-zengheng@huaweicloud.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgB3ej_iah1qEvbwAA--.46998S4
X-Coremail-Antispam: 1UD129KBjvdXoWrtFyDJFyxCr47Aw18ur15Arb_yoWfZFX_tr
	1xKa4rWryfAFy0qayFya4fAryjkFW8tr98GF1IqrZ8GF9Ivr1xCrWrKFyrCws8Z3WSgrWU
	Ja4DZr1kArZFqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_JFC_Wr1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kK
	e7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_
	WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	jxCztUUUUU=
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_FROM(0.00)[bounces-90283-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[huaweicloud.com];
	TAGGED_RCPT(0.00)[linux-doc];
	R_DKIM_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zengheng@huaweicloud.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.833];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,huaweicloud.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6F93B61E3D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Zeng Heng <zengheng4@huawei.com>

v2: https://lore.kernel.org/all/20260529063132.766491-1-zengheng@huaweicloud.com/
v1: https://lore.kernel.org/all/20260526015720.206854-1-zengheng@huaweicloud.com/

Changes in v3:
  - Keep CONFIG_ARM64_WORKAROUND_DISABLE_CNP config and generalise
    ARM64_WORKAROUND_DISABLE_CNP capability.

Changes in v2:
  - Unify CNP disable workaround into ARM64_WORKAROUND_DISABLE_CNP

Zeng Heng (2):
  arm64: cpufeature: Add WORKAROUND_DISABLE_CNP capability
  arm64: kernel: Disable CNP on HiSilicon HIP09

 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 20 ++++++++++++++++++++
 arch/arm64/include/asm/cpucaps.h            |  4 ++--
 arch/arm64/kernel/cpu_errata.c              | 17 ++++++++++++-----
 arch/arm64/kernel/cpufeature.c              |  2 +-
 arch/arm64/tools/cpucaps                    |  2 +-
 6 files changed, 38 insertions(+), 9 deletions(-)

--
2.43.0



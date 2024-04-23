Return-Path: <linux-doc+bounces-14897-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9008AE76C
	for <lists+linux-doc@lfdr.de>; Tue, 23 Apr 2024 15:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D37B1F24C53
	for <lists+linux-doc@lfdr.de>; Tue, 23 Apr 2024 13:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF180134735;
	Tue, 23 Apr 2024 13:07:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D5A745E2;
	Tue, 23 Apr 2024 13:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713877674; cv=none; b=tki+Mv6T1W6+6oTKgAbdRXJrc97RSBkM6dEHpZzlvrw6hVn7LcYZyrFYzMVkERZr617kXYqYeXAW73pvsy9ggXiO1WIh4dCmKGZhiU7klwp0Y60VBXgi38BTHyow6hgojBbk/oFTL7MY3AsQYrR9dNiX7L22477M2Jzy0HMsu/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713877674; c=relaxed/simple;
	bh=RMkC9XGtvKbtiP3vQ4Bbafja2c2NELobFeSzGPnHBgE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P+ZGP9rZhwzFm25TdwRuBmDcZUM3rBHtCf7YeKtW+a0LLrsrEueiS2BodaZB31Gh1HKM48uunjKa+GF0Ng71cAr7jD8/VrfbvpKnASUC4xKGy9tKc40GJo5C6u1DzYV4ACYC6O85qAAgM0vnmI0YsEShNLw+np3HRcTsmNrB3ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8DxPOuhsidmKmQBAA--.1300S3;
	Tue, 23 Apr 2024 21:07:45 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxTN6esidmK18CAA--.10071S2;
	Tue, 23 Apr 2024 21:07:44 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: ojeda@kernel.org,
	corbet@lwn.net,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	alexs@kernel.org,
	dzm91@hust.edu.cn
Cc: Yanteng Si <siyanteng@loongson.cn>,
	linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v1 0/4] rust: docs: Update the translation of rust to 6.9-rc4
Date: Tue, 23 Apr 2024 21:07:25 +0800
Message-Id: <cover.1713875158.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxTN6esidmK18CAA--.10071S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZFWDJFy7uFWkXw1xtryxJFc_yoW3Wwb_Z3
	97ZayFya1kZF4xtFWxGrW7CrW0kay0q34FqFnYq398G34qy398Xw1DXr93Wws3uF45Jry3
	GrZ7GryfXr4xWosvyTuYvTs0mTUanT9S1TB71UUUUbUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7TmhUUUUU

The Chinese version of rust seems to be way behind,
even though we did translate to Chinese at the beginning.
Let's keep them up to date. :)

Yanteng Si (4):
  docs/zh_CN/rust: Update the translation of arch-support to 6.9-rc4
  docs/zh_CN/rust: Update the translation of coding-guidelines to 6.9-rc4
  docs/zh_CN/rust: Update the translation of general-information to 6.9-rc4
  docs/zh_CN/rust: Update the translation of quick-start to 6.9-rc4

 .../translations/zh_CN/rust/arch-support.rst  | 13 +++--
 .../zh_CN/rust/coding-guidelines.rst          | 12 +++++
 .../zh_CN/rust/general-information.rst        |  2 +-
 .../translations/zh_CN/rust/quick-start.rst   | 50 +++++++++++++------
 4 files changed, 55 insertions(+), 22 deletions(-)

-- 
2.31.4



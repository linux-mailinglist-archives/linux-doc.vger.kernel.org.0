Return-Path: <linux-doc+bounces-47455-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 654C8AC379A
	for <lists+linux-doc@lfdr.de>; Mon, 26 May 2025 03:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E94317214C
	for <lists+linux-doc@lfdr.de>; Mon, 26 May 2025 01:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D359E78F2B;
	Mon, 26 May 2025 01:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b="AEBMBKyv"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86E47261F
	for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 01:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748222086; cv=none; b=CfEX8U+zftwMaAqmH8hCNFzlnOwosg5lH0oy9YKtClrvyyUJaD6iZCQ4anQyf6BCdTuqhQrPO+RSjdmDy3g6UkjW+9MsFtXlfgsiHqxZrliuR7SfSEy9NqChs6jR/Q463eLnA1wrUyJGAsNOmqXcyn/cqAqPjUSm4WTGHEE7+MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748222086; c=relaxed/simple;
	bh=f/hU0A4fj7QtWBQH2wuFRAHY6Jn+TSEpqOX3PSwRgxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jusZMrmQImJDrx/h1E2MZIQSfaHupTT1oc2c5Jd75+0/W2DFAK74a8kJXAWnGpQLEb3mpNQvsT0xwoA5WoAay5dUKPcI3LDVcj6IMzBRDkdajD6Wet87S1wvNeoU/nHqJ/eiTndyO6WdhQVOlQKrNpk3KPgQQ/X+Krjv8mv/gJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com; spf=pass smtp.mailfrom=gvernon.com; dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b=AEBMBKyv; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gvernon.com
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gvernon.com; s=key1;
	t=1748222082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2faVC+lp75YU3Dl0uKzBt9yom+JW37tJfjBoBIwCVG8=;
	b=AEBMBKyvkrgkxmZdF6kLdNpqNLCtOA/Mpd6oSfHPu6oqZpO3v6oiykCv1vLrYHtpo76UCp
	tMaunoDwSmbsbhM2mOwc84uosmL5uwyVk0TAoqysaHCcLKVv4VX4/u+sZffpzdVgpRLLyo
	ILobwYhIbrlJj9hoiYnT7O7UVEhgidBHHDtsIJVuqRVEkiDL8AouJARxoO83nj5KS5ojcb
	LX2jh0VEy6oi7ZRCIdTzgV9slfeNLQpr6GysL06hmyLZ7UNfEQDX2MXyQt4FThYXHsOebX
	JR1TBc46bNTUMv/QYSTjrHOB709V94faQz923qCi7lPO/TG8EM80f3lk3FEB5g==
From: George Anthony Vernon <contact@gvernon.com>
To: dmitry.torokhov@gmail.com,
	corbet@lwn.net,
	skhan@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	George Anthony Vernon <contact@gvernon.com>
Subject: [PATCH 1/3] input: docs: Fix broken table formatting
Date: Mon, 26 May 2025 02:14:41 +0100
Message-ID: <20250526011443.136804-2-contact@gvernon.com>
In-Reply-To: <20250526011443.136804-1-contact@gvernon.com>
References: <20250526011443.136804-1-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Missing '+' led to unintended spanning cell. Correct this.

Signed-off-by: George Anthony Vernon <contact@gvernon.com>
---
 Documentation/input/devices/amijoy.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/input/devices/amijoy.rst b/Documentation/input/devices/amijoy.rst
index 8df7b11cd98d..f854ee975247 100644
--- a/Documentation/input/devices/amijoy.rst
+++ b/Documentation/input/devices/amijoy.rst
@@ -123,7 +123,7 @@ JOY1DAT   Y7  Y6  Y5  Y4  Y3  Y2  Y1  Y0     X7  X6  X5  X4  X3  X2  X1  X0
         clocked by 2 of the signals input from the mouse serial
         stream. Starting with first bit received:
 
-         +-------------------+-----------------------------------------+
+         +--------+----------+-----------------------------------------+
          | Serial | Bit Name | Description                             |
          +========+==========+=========================================+
          |   0    | M0H      | JOY0DAT Horizontal Clock                |
-- 
2.49.0



Return-Path: <linux-doc+bounces-37748-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30805A3040D
	for <lists+linux-doc@lfdr.de>; Tue, 11 Feb 2025 08:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96CB518895A3
	for <lists+linux-doc@lfdr.de>; Tue, 11 Feb 2025 07:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEBDE1D79B8;
	Tue, 11 Feb 2025 07:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQ74n4sF"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9654726BDB6;
	Tue, 11 Feb 2025 07:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739257258; cv=none; b=SDax0E76ijQDv0LiEiMytqYLMN/Ni6jYHtqHRVB9UHDSizjymOPRW9ZP+qpJNkCn7BvlVxBEB/Rnakf78Ypd8frgo4yribx8ZgFAj0qfLq+SjeUFr/URKQy/CbxL1z7xcDZyYq2TJb1K18oMJwGPWRRuRsoaRhBUOMg4A/jQYeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739257258; c=relaxed/simple;
	bh=31QWdnjJ3Q7WNte0pNALik3EiaOkqFc9f2Wf++QpPF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dKbVuhpWu0YaXFWsswd8ELDM5FhC/r4LeRk9AOq9dmr7w1DBGfvYFAz4bbtV1wEO6EuJ5bgl/vmv3YDr7xKlnfhnEsG1qRvT5u7ok9Xf8mvtFabKqq+f+1pS8cemOiIIeLRmceez8e7pEaWZxx+9cJK5gZ7Dgb1Vpc2oAklz9+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQ74n4sF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130C3C4CEDD;
	Tue, 11 Feb 2025 07:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739257258;
	bh=31QWdnjJ3Q7WNte0pNALik3EiaOkqFc9f2Wf++QpPF8=;
	h=From:To:Cc:Subject:Date:From;
	b=KQ74n4sFxhlL0HwATB55Z1PNtVgs22A9iD2hHFn1M2Dv0SmYX2xo3T1Xt8hzXHjZO
	 QW6G5DJqLSsz/1DrO6tiMjvN1liui/jGFYiiRlUZOGpfEzdoQWHOjhxMEck+PutzCy
	 +287U5wRb5mwxXNX6JlXwAyQjSumrMVUbP+Nh5egfNecd/wL/AzvbCFHvTitmRGqMA
	 YDvLxmsZuz2TNFG2XXOZ1VDxHImV0yXbfwaTJteRX+Lboc3CXVAYj2EuviCCH0tSmr
	 Ehj67aoI1wXX9YLPZbjpU6fOUFEO/kQHZllZlPCL0V61myTxH96SoM2bUpdDC10i0d
	 zLiwJ4qFJ7+pQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thkGO-00000008ZVQ-0S8s;
	Tue, 11 Feb 2025 08:00:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: trace: decode_msr.py: make it compatible with python 3
Date: Tue, 11 Feb 2025 08:00:46 +0100
Message-ID: <88bb0d47100feaa3cda215e68bf6500dc67da7b3.1739257245.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

This script uses print <foo> instead of print(foo), which is
incompatible with Python 3.

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/trace/postprocess/decode_msr.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/postprocess/decode_msr.py b/Documentation/trace/postprocess/decode_msr.py
index aa9cc7abd5c2..f5609b16f589 100644
--- a/Documentation/trace/postprocess/decode_msr.py
+++ b/Documentation/trace/postprocess/decode_msr.py
@@ -32,6 +32,6 @@ for j in sys.stdin:
 					break
 		if r:
 			j = j.replace(" " + m.group(2), " " + r + "(" + m.group(2) + ")")
-	print j,
+	print(j)
 
 
-- 
2.48.1



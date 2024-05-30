Return-Path: <linux-doc+bounces-17321-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C46D98D526F
	for <lists+linux-doc@lfdr.de>; Thu, 30 May 2024 21:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81819284B54
	for <lists+linux-doc@lfdr.de>; Thu, 30 May 2024 19:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBDC158874;
	Thu, 30 May 2024 19:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KzkS8yss"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632E01581E6;
	Thu, 30 May 2024 19:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717098024; cv=none; b=V802jagje5e2NDnj9HemkA1SBZQW0/5DIKOc9JWZ8V6hnvc3UrY1I1zcDi654VXoBUdnzpJnrVoB+zRUtZLUkpnk1tos7tdPmrTAa1N0FDg5wve8daVTBNRj70528WXvyOKnFds3GLfqZdaHXwfStcP4CbBcIFYCTF+C6LjTXbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717098024; c=relaxed/simple;
	bh=6t4ucfVQU5IhpW6tV4jq89ulxuxseh0LAzYdxXu+roM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qy7YEfSF7jNf6LpMNkR4qag7jdtRMdEnV0K2+9wMz6AKEGClMvn46WF7kOsx8gXXS5FggWbnST6J5+gpGXggglS+yOrPSiKeq7ZLXQN5iF2PclBokTUZ2FgZFCvyGubY/IM6ZVM1mfpRgQWGynW5tYxnlX2jZWoPTsmjiT2Yyd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KzkS8yss; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 77D6647C39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1717098018; bh=6t4ucfVQU5IhpW6tV4jq89ulxuxseh0LAzYdxXu+roM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KzkS8yssKHAMRkHErsJ1yr0CmW6ubVSb/9GTDD7+gLW565XpHv7i2w8tumBxNorkM
	 IfIu/AippndrfS+kmW8MTu7TupdqsxS1a/m16YgYvRQi9Szt0FyoilHg2mqfflY5vX
	 5w6qvwsCl4BXeR77mt2RmnQ5xDRGo8/xsELFNJAF471V8Yz0QA2qcdO1C6s1AoeU+F
	 H46denSKHaCQOOaP2N8qwf0fx7MCx7+xL/0f4c1ZCATiMhwyJxOa/0wrdhm5OrEA69
	 etKie6WGRsF8QMLUcX0N2H9xj4z8VaxucF6ckWn8OEZ4aIRrklWhb2eE4MDVSrrwQZ
	 6YfleVvUH1myQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 77D6647C39;
	Thu, 30 May 2024 19:40:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Conor Dooley <conor@kernel.org>
Cc: conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 kanakshilledar111@protonmail.com, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Mark Brown <broonie@kernel.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Documentation: process: Revert "Document suitability
 of Proton Mail for kernel development"
In-Reply-To: <20240516-groin-slingshot-c3c3734d2f10@spud>
References: <20240516-groin-slingshot-c3c3734d2f10@spud>
Date: Thu, 30 May 2024 13:40:17 -0600
Message-ID: <87a5k7ccm6.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Conor Dooley <conor@kernel.org> writes:

> From: Conor Dooley <conor.dooley@microchip.com>
>
> Revert commit 1d2ed9234c85 ("Documentation: process: Document
> suitability of Proton Mail for kernel development") as Proton disabled
> WKD for kernel.org addresses as a result of some interaction with
> Konstantin on social.kernel.org
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied, thanks.

jon


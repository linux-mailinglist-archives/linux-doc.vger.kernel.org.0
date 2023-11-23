Return-Path: <linux-doc+bounces-2984-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 335707F63BD
	for <lists+linux-doc@lfdr.de>; Thu, 23 Nov 2023 17:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 653FB1C209A4
	for <lists+linux-doc@lfdr.de>; Thu, 23 Nov 2023 16:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E27C3E487;
	Thu, 23 Nov 2023 16:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=walle.cc header.i=@walle.cc header.b="wqByrB3M"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7AA83;
	Thu, 23 Nov 2023 08:15:53 -0800 (PST)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 79A3C33C;
	Thu, 23 Nov 2023 17:15:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1700756151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3mKxwmjen41Ks2QpqmtZQa7d9qvwTznyPnsUUWAHpOg=;
	b=wqByrB3M51mgwtA9Ou51bwSQ1rOjoonS140m3LdB2kZkTiFC8mcZmoMBdFQFbf7qM8XjcI
	JejDDfDG8kmJPoK5c2qzro2A5ihcgeyz9sYxanMSrdE9Mybxy0S/oH7akUhqibOmmvPRZf
	gUp/AOkHH0oYkSM47UPKEbq4004yAEvKZfIOsV4c2D7opK9JdCCDBtAmEWD/2ncxqAIMkW
	LCiOjLt3tXYwLBqIbBLzwaxuVbvaOqWNnnUzaJAjhLMWGKEoRH4ub9vz+FpdJqE4caxtVV
	+h//ZH1Lz4quO70pmmARZFa7EH8GevDTJBHLDoEY+gGJxEWkB7IShNmKKrO0ag==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 23 Nov 2023 17:15:51 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-doc@vger.kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: mtd: spi-nor: drop obsolete info
In-Reply-To: <20231123160721.64561-3-tudor.ambarus@linaro.org>
References: <20231123160721.64561-1-tudor.ambarus@linaro.org>
 <20231123160721.64561-3-tudor.ambarus@linaro.org>
Message-ID: <ea3aeb73f087bdd9719fb88aafda7ad1@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

> The architecture description is obsolete, it no longer applies to
> the current SPI NOR framework state, remove it.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Michael Walle <michael@walle.cc>


Return-Path: <linux-doc+bounces-23625-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB8095C2DA
	for <lists+linux-doc@lfdr.de>; Fri, 23 Aug 2024 03:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B772B221A6
	for <lists+linux-doc@lfdr.de>; Fri, 23 Aug 2024 01:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BF7171D8;
	Fri, 23 Aug 2024 01:35:02 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5636D18026;
	Fri, 23 Aug 2024 01:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724376902; cv=none; b=kWEbpc/j8GCzTbIu5hC054TWQZX+ZQd9kRPeDkm63pDd0j1YSC80ADXkmXjYXpEy61Prk3f73YohUFACN6CVmOrlIshX+dgpWgz3cfr1tWHL6yRKdo/Ju3JNgXaGdqwsK+OWzT33oI6M1AzZ1+OOM/3+jBkW6SItNNXkxYdaDps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724376902; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Message-ID:Date:From:To; b=DbVYfhvXK+fiIQWWnnakTrEhk2B/sHTb83ScBoA4nnN4/sds3A4Od6tkUTbIvxgNjsTU72bARdFOw4b51/QYYKIyZxaku1DGzkAi++jkqam81TNnnBlkOZ52I78H0xviajLDm04I7lY2ySyaaqH7LwuZ3p4m0r6AzJA55ik3WVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8457C32782;
	Fri, 23 Aug 2024 01:35:01 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1shJDC-00000003ZZt-2iIV;
	Thu, 22 Aug 2024 21:35:34 -0400
Message-ID: <20240823012759.104312161@goodmis.org>
User-Agent: quilt/0.68
Date: Thu, 22 Aug 2024 21:27:59 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>



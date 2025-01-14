Return-Path: <linux-doc+bounces-35274-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1782FA114E3
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jan 2025 00:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36F58166758
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jan 2025 23:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D42821423A;
	Tue, 14 Jan 2025 22:59:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EB8212D6B
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 22:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736895583; cv=none; b=oJAGiQTuupIlBT4OT7atSvQ0fcQ94zAkaRrR+vZgFx1eETRe+yFnEvQgACh2NGFPWUOe8yfTQf70mAsFwww6PkzLKeD8hFwwSmATCw2sSuA6JfBOHtCxsEAZV51ABee/FoTvREhIBF5pybfyz0j9KzINJZq95edout27NQyqmyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736895583; c=relaxed/simple;
	bh=suNZXz59Sz+AYEidJeKgqkinZ87y8iwjQ/kG/RA+K0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B7E++uhjDO3KKIU9LelYoX7MAWBWQKunlWvVFcLNFaNfQZ+o+PdmEq+A9DvYRyDUcDhVOE5Bd5RedYPhsSHEwo1kfGe8Z56BB5G6iW/EsFWwg7jw2tjah4gOh7FmnrOpA/bFqkg57tmYohNFEJESO36JT7FFtLYjvmc7omhk5UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 50EMxWp9094037;
	Wed, 15 Jan 2025 07:59:32 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 50EMxWeh094032
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 15 Jan 2025 07:59:32 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <1b4275ad-a07b-4647-9d2b-48af08cdbebe@I-love.SAKURA.ne.jp>
Date: Wed, 15 Jan 2025 07:59:33 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Docs/security: update cmdline keyword usage
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>, Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <sergeh@kernel.org>,
        linux-security-module@vger.kernel.org,
        Kentaro Takeda <takedakn@nttdata.co.jp>,
        John Johansen <john.johansen@canonical.com>,
        John Johansen <john@apparmor.net>, Jonathan Corbet <corbet@lwn.net>
References: <20250114225156.10458-1-rdunlap@infradead.org>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20250114225156.10458-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav403.rs.sakura.ne.jp
X-Virus-Status: clean

On 2025/01/15 7:51, Randy Dunlap wrote:
> Use "lsm=name,..." instead "security=name,..." since the latter is
> deprecated.

Sorry, but security= is for specifying only one of exclusive LSM modules
whereas lsm= is for specifying both one of exclusive LSM modules and
all of non-exclusive LSM modules. That is, you can't deprecate
security= using s/security=/lsm=/g .



Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B40D42D6B5F
	for <lists+linux-doc@lfdr.de>; Fri, 11 Dec 2020 00:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730820AbgLJXAG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Dec 2020 18:00:06 -0500
Received: from ms.lwn.net ([45.79.88.28]:55464 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727879AbgLJW7u (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 Dec 2020 17:59:50 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9F61E2DC;
        Thu, 10 Dec 2020 22:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9F61E2DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1607641140; bh=ORWqG6BdsICXD7FaiPh2+TxXNl7jfqY1sG2tNye5gd8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cRE2MGslb3QcF/UbZXZAXPdIOa4LHgawtrMpUsZtGvonRytzIU4BpL7x2411MToGB
         M7BpgJO5qjIrJeXqwE82IGkBWeiwk8B1cOUmPCTKClyfa9WAlqCygStsvfidTVOlJE
         wZ19Jy8vWZ6VXjOkfm19DRWKinxz54ZRvh2nVgKWu2yHRhvdbK4xrkNLzhYczov9Su
         JeJXSCRsuicLXQsJstxr4b3qPyqMQk19jJUMWsLKj9lshHupwwO4DVwJMBO/7alCZj
         trl1VkFE3osHr70mwU7pR8vXHNAwJ8nrF/XL9XTwcK9DAa1juTd5dQs4CVLUjMYycd
         rVgeakeX4QV0w==
Date:   Thu, 10 Dec 2020 15:58:59 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc:     Ard Biesheuvel <ardb@kernel.org>, Ivan Hu <ivan.hu@canonical.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>
Subject: Re: [RFC] Documentation for /dev/efi_test
Message-ID: <20201210155859.5c3babee@lwn.net>
In-Reply-To: <0d27217e-15c4-32e5-0dc3-47b94116ad64@gmx.de>
References: <0d27217e-15c4-32e5-0dc3-47b94116ad64@gmx.de>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 10 Dec 2020 22:49:09 +0100
Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:

> to test UEFI runtime services we have CONFIG_EFI_TEST which provides
> /dev/efi_test and a bunch of IOCTLs for excercising the runtime services
> (cf. drivers/firmware/efi/test/efi_test.h).
> 
> Currently there is no user documentation for this ABI.
> 
> Where should the documentation for the ABI be put in the documentation
> tree? Is this Documentation/ABI/stable/?

To date, nobody has documented ioctl() interfaces under Documentation/ABI;
this probably isn't the time to start.  The best way to document it might
be to put your testing code in the tools/testing directory.  You could
also add something to the userspace-api manual as well, but that might
increase your chances of being committed to maintaining that interface
forever...

Thanks,

jon

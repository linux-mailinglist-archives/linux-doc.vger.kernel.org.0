Return-Path: <linux-doc+bounces-3198-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 458297FA856
	for <lists+linux-doc@lfdr.de>; Mon, 27 Nov 2023 18:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76F4D1C20B70
	for <lists+linux-doc@lfdr.de>; Mon, 27 Nov 2023 17:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DC5746B;
	Mon, 27 Nov 2023 17:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="XriM3MjP"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 663E2189;
	Mon, 27 Nov 2023 09:52:05 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0E1BF2D7;
	Mon, 27 Nov 2023 17:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0E1BF2D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1701107525; bh=zZ/bza4MDEjj1yNcX/92zO0s45RTP0WbGzGyikArnbY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XriM3MjPOyAwGbdRhfZRzEZlQW8QmwQ6BhyL+DHbDzO66VY8LGIlZmSWZAr9kZpmS
	 ktPCNDBW5Fs4bF0qLUTVsyXwuvxGupxV68nvwX8mGnsd5vIOFhaLSQE0FuG59Ya3Yi
	 FY/AmtXUgREtDuHXe5HAq5Gw9mHOhqEOmeb/9p+tW8GooiyDDIPHtiKmsqJF9lVuv6
	 ProFylXRVeR+0u3xVg3C3dtRsfUY7IQxvZQDm8TXTK4QKwyXqUZss4i8GsX7AHvGhT
	 GhQHuo2MR8fVhApFE6TkVxGo28cPj7Z6rOo79BzX76ZZ5f2pJDtGq1teY8tZeX9RPV
	 jbC1+bvk6rLYw==
From: Jonathan Corbet <corbet@lwn.net>
To: Sumit Garg <sumit.garg@linaro.org>, jens.wiklander@linaro.org
Cc: vegard.nossum@oracle.com, Rijo-john.Thomas@amd.com,
 balint.dobszay@arm.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, Sumit Garg
 <sumit.garg@linaro.org>
Subject: Re: [PATCH v2] Documentation: Destage TEE subsystem documentation
In-Reply-To: <20231103061715.196294-1-sumit.garg@linaro.org>
References: <20231103061715.196294-1-sumit.garg@linaro.org>
Date: Mon, 27 Nov 2023 10:52:04 -0700
Message-ID: <87h6l7yth7.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sumit Garg <sumit.garg@linaro.org> writes:

> Add a separate documentation directory for TEE subsystem since it is a
> standalone subsystem which already offers devices consumed by multiple
> different subsystem drivers.
>
> Split overall TEE subsystem documentation modularly where:
> - The userspace API has been moved to Documentation/userspace-api/tee.rst.
> - The driver API has been moved to Documentation/driver-api/tee.rst.
> - The first module covers the overview of TEE subsystem.
> - The further modules are dedicated to different TEE implementations like:
>   - OP-TEE
>   - AMD-TEE
>   - and so on for future TEE implementation support.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>
> Changes in v2:
> - Move userspace API to Documentation/userspace-api/tee.rst.
> - Move driver API to Documentation/driver-api/tee.rst.
>
>  Documentation/driver-api/index.rst    |   1 +
>  Documentation/driver-api/tee.rst      |  66 +++++
>  Documentation/staging/index.rst       |   1 -
>  Documentation/staging/tee.rst         | 364 --------------------------
>  Documentation/subsystem-apis.rst      |   1 +
>  Documentation/tee/amd-tee.rst         |  90 +++++++
>  Documentation/tee/index.rst           |  19 ++
>  Documentation/tee/op-tee.rst          | 166 ++++++++++++
>  Documentation/tee/tee.rst             |  22 ++
>  Documentation/userspace-api/index.rst |   1 +
>  Documentation/userspace-api/tee.rst   |  39 +++
>  MAINTAINERS                           |   4 +-
>  12 files changed, 408 insertions(+), 366 deletions(-)
>  create mode 100644 Documentation/driver-api/tee.rst
>  delete mode 100644 Documentation/staging/tee.rst
>  create mode 100644 Documentation/tee/amd-tee.rst
>  create mode 100644 Documentation/tee/index.rst
>  create mode 100644 Documentation/tee/op-tee.rst
>  create mode 100644 Documentation/tee/tee.rst
>  create mode 100644 Documentation/userspace-api/tee.rst

So I finally got around to applying this...after dealing with the fact
that it doesn't apply to docs-next, I found that it adds a couple of
warnings:

> Warning: Documentation/security/keys/trusted-encrypted.rst references a file that doesn't exist: Documentation/staging/tee.rst
> Warning: drivers/tee/optee/Kconfig references a file that doesn't exist: Documentation/staging/tee.rst

Can I get a version that doesn't leave dangling references like that
around?

Thanks,

jon


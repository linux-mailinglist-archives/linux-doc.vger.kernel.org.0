Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92E7665B820
	for <lists+linux-doc@lfdr.de>; Tue,  3 Jan 2023 00:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjABXRY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 2 Jan 2023 18:17:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbjABXRW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Jan 2023 18:17:22 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E5D463EA
        for <linux-doc@vger.kernel.org>; Mon,  2 Jan 2023 15:17:20 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 706A92E0;
        Mon,  2 Jan 2023 23:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 706A92E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1672701440; bh=uKPf6FBnqdmdaUqyMdkOPjo4/Zi6ih7wuw8Kwajy44o=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=GyxlIjopaNMdA3mxD+U27DGsXfoyTBOoIBQ1Gtei1yClxNvhs8a8Zocg6iRf9iOeR
         1ZmPGW+sViRPISivbzxtbGZGQKzII8boRBKlmWVxObLmjQFId/0ys8SvfVDAdHqNMo
         2CXSnqGqNUTmFVDnOiBjgNL30fgTPAe91bQ+uPESJlzWPMVN0lQDHYlL5xD0eN+C27
         SuTQu6gAZ4sza40R9ytAdvPH5p2fDfu0FGzv+DU0uIFNDPNGPHNaft0qMwkJMp1QC4
         cXDMh3CFDbRBNRu06kVwSUElEl5dM+p07uyVTZMMt+iu7sq/HRgBpa3441CwTYGYaE
         ZjzEEzQH/YWqg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, bobwxc@email.cn,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v2 00/13] docs/zh_CN: Update the translation to 6.1-rc8
In-Reply-To: <cover.1670642548.git.siyanteng@loongson.cn>
References: <cover.1670642548.git.siyanteng@loongson.cn>
Date:   Mon, 02 Jan 2023 16:17:19 -0700
Message-ID: <874jt8il1c.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> v2:
> Modify some words under Xiangcheng's advice.
>
> v1:
> The following files were updated to 6.1-rc8:
> accounting
> admin-guide/mm
> core-api
> dev-tools
> mm
> PCI
> power
>
> Yanteng Si (13):
>   docs/zh_CN: Update the translation of delay-accounting to 6.1-rc8
>   docs/zh_CN: Update the translation of kernel-api to 6.1-rc8
>   docs/zh_CN: Update the translation of mm-api to 6.1-rc8
>   docs/zh_CN: Update the translation of highmem to 6.1-rc8
>   docs/zh_CN: Update the translation of page_owner to 6.1-rc8
>   docs/zh_CN: Update the translation of kasan to 6.1-rc8
>   docs/zh_CN: Update the translation of testing-overview to 6.1-rc8
>   docs/zh_CN: Update the translation of reclaim to 6.1-rc8
>   docs/zh_CN: Update the translation of start to 6.1-rc8
>   docs/zh_CN: Update the translation of usage to 6.1-rc8
>   docs/zh_CN: Update the translation of ksm to 6.1-rc8
>   docs/zh_CN: Update the translation of msi-howto to 6.1-rc8
>   docs/zh_CN: Update the translation of energy-model to 6.1-rc8
>
>  .../translations/zh_CN/PCI/msi-howto.rst      | 11 +++
>  .../zh_CN/accounting/delay-accounting.rst     |  7 +-
>  .../zh_CN/admin-guide/mm/damon/reclaim.rst    |  4 -
>  .../zh_CN/admin-guide/mm/damon/start.rst      | 12 +--
>  .../zh_CN/admin-guide/mm/damon/usage.rst      | 68 ++++++++++++-----
>  .../translations/zh_CN/admin-guide/mm/ksm.rst | 50 +++++++++++++
>  .../zh_CN/core-api/kernel-api.rst             | 10 ++-
>  .../translations/zh_CN/core-api/mm-api.rst    |  2 +-
>  .../translations/zh_CN/dev-tools/kasan.rst    | 74 ++++++++++---------
>  .../zh_CN/dev-tools/testing-overview.rst      | 27 +++++++
>  .../translations/zh_CN/mm/highmem.rst         | 20 ++++-
>  .../translations/zh_CN/mm/page_owner.rst      | 17 +----
>  .../translations/zh_CN/power/energy-model.rst | 36 +++++++--
>  13 files changed, 243 insertions(+), 95 deletions(-)

Series applied, thanks.

jon

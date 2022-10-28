Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEF35611A3B
	for <lists+linux-doc@lfdr.de>; Fri, 28 Oct 2022 20:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiJ1SjO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 28 Oct 2022 14:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJ1SjN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Oct 2022 14:39:13 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD016386E
        for <linux-doc@vger.kernel.org>; Fri, 28 Oct 2022 11:39:13 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BF9F260C;
        Fri, 28 Oct 2022 18:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BF9F260C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1666982352; bh=aTDMPxCxgPrQ9x5CfbpJECfz64JMFJuwPfDiwqmWxg8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=bQnz8GU12HLubaBrC4YJLOO1bXEGYZ5Lv1Z+Rd+xOw1uVQv6IJ2rbjaYHh9ZixgTU
         Ajz0hJVfz0ksh9eIyeClAlKzKGPfKuC42EfXVo5O5QMtE6o/Y8CaNkm8qJzEcVyLdb
         wGQQv5oNwsciAhSEd/MOrbk1Q4Ird0fwkspRbEpnuNHRthAjxyVg6oSwel3KF3iHBl
         yb+Tm8hdjtweT+1GAZrL/C2mf6vWcsA/E9x+0qYmfTDH7gOeg46QL+FPRXeGtO6mb+
         gkvV+B8vZJmBkmvDJJ0mzH/aPwUSxzn1XKBa0YBIpBWxLUbyvJ2IiM4PNSu+iA1skc
         4amBfZnlYlRVQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     WANG Xuerui <kernel@xen0n.name>, linux-doc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>, loongarch@lists.linux.dev
Subject: Re: [PATCH 0/2] LoongArch syscall ABI documentation
In-Reply-To: <20221018100457.3440691-1-kernel@xen0n.name>
References: <20221018100457.3440691-1-kernel@xen0n.name>
Date:   Fri, 28 Oct 2022 12:39:12 -0600
Message-ID: <874jvn6be7.fsf@meer.lwn.net>
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

WANG Xuerui <kernel@xen0n.name> writes:

> From: WANG Xuerui <git@xen0n.name>
>
> Hi,
>
> Due to popular demand [1] (even Loongson employees can get lost), the
> current LoongArch syscall ABI is now documented. A Simplified Chinese
> translation is included too.
>
> [1]: https://github.com/loongson/LoongArch-Documentation/issues/66
>
> WANG Xuerui (2):
>   Documentation: LoongArch: Document the syscall ABI
>   docs/zh_CN: LoongArch: Translate the syscall ABI doc
>
>  Documentation/loongarch/index.rst             |  1 +
>  Documentation/loongarch/syscall-abi.rst       | 36 ++++++++++++++++++
>  .../translations/zh_CN/loongarch/index.rst    |  1 +
>  .../zh_CN/loongarch/syscall-abi.rst           | 37 +++++++++++++++++++
>  4 files changed, 75 insertions(+)
>  create mode 100644 Documentation/loongarch/syscall-abi.rst
>  create mode 100644 Documentation/translations/zh_CN/loongarch/syscall-abi.rst

Would you like me to take these through the docs tree?

Thanks,

jon

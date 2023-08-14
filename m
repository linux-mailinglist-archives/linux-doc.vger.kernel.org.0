Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C78A77C034
	for <lists+linux-doc@lfdr.de>; Mon, 14 Aug 2023 21:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbjHNTAF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 14 Aug 2023 15:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231722AbjHNS7h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Aug 2023 14:59:37 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7760210F7;
        Mon, 14 Aug 2023 11:59:36 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id DA76737B;
        Mon, 14 Aug 2023 18:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DA76737B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1692039576; bh=hBASCn6VlYpnxVhZtbOLEsYPyjSypEeLvxEURgg1WUY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=P+rK+BGO4HN7yMWwDMGhuyxsFS2/KABD2tuJMDwl9EGr3BqFMLpJMaRO/+tT2kwZT
         9mlszdyBc6U2vDZ7KWsxQYb3GIaQkiYSmclJULeJA7Qf6uSXcoHVIBMmkNJFcebebk
         zSp5NhIhVxoOYphgY7udxc7j5ziHOE/905a0kkx9umMAjygYS69rvpbegfhjGNKJAG
         QrtsMeIlOxmL+8bwJEKTfnv7k8ytMEhpt+DAZMaW0AKB/ts/RetwA6mh2XBSCj9iJv
         i9qDcDJAvA1NOWIPXqBwolXgQgueKmWpsBGT1r7rlmIPuR3IA/zjM+OaFu6oLaKDMs
         7m/bDLda5BhAg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Pavan Kumar Linga <pavan.kumar.linga@intel.com>,
        netdev@vger.kernel.org, kuba@kernel.org
Cc:     linux-doc@vger.kernel.org, emil.s.tantilov@intel.com,
        joshua.a.hay@intel.com, sridhar.samudrala@intel.com,
        alan.brady@intel.com, madhu.chittim@intel.com,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        willemb@google.com, decot@google.com, rdunlap@infradead.org,
        Pavan Kumar Linga <pavan.kumar.linga@intel.com>
Subject: Re: [PATCH net-next v2 2/2] scripts: kernel-doc: fix macro handling
 in enums
In-Reply-To: <20230814170720.46229-3-pavan.kumar.linga@intel.com>
References: <20230814170720.46229-1-pavan.kumar.linga@intel.com>
 <20230814170720.46229-3-pavan.kumar.linga@intel.com>
Date:   Mon, 14 Aug 2023 12:59:35 -0600
Message-ID: <87ttt1v4a0.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Pavan Kumar Linga <pavan.kumar.linga@intel.com> writes:

> drivers/net/ethernet/intel/idpf/idpf.h uses offsetof to
> initialize the enum enumerators:
>
> enum {
> 	IDPF_BASE_CAPS = -1,
> 	IDPF_CSUM_CAPS = offsetof(struct virtchnl2_get_capabilities,
> 				  csum_caps),
> 	IDPF_SEG_CAPS = offsetof(struct virtchnl2_get_capabilities,
> 				 seg_caps),
> 	IDPF_RSS_CAPS = offsetof(struct virtchnl2_get_capabilities,
> 				 rss_caps),
> 	IDPF_HSPLIT_CAPS = offsetof(struct virtchnl2_get_capabilities,
> 				    hsplit_caps),
> 	IDPF_RSC_CAPS = offsetof(struct virtchnl2_get_capabilities,
> 				 rsc_caps),
> 	IDPF_OTHER_CAPS = offsetof(struct virtchnl2_get_capabilities,
> 				   other_caps),
> };
>
> kernel-doc parses the above enumerator with a ',' inside the
> macro and treats 'csum_caps', 'seg_caps' etc. also as enumerators
> resulting in the warnings:
>
> drivers/net/ethernet/intel/idpf/idpf.h:130: warning: Enum value
> 'csum_caps' not described in enum 'idpf_cap_field'
> drivers/net/ethernet/intel/idpf/idpf.h:130: warning: Enum value
> 'seg_caps' not described in enum 'idpf_cap_field'
> drivers/net/ethernet/intel/idpf/idpf.h:130: warning: Enum value
> 'rss_caps' not described in enum 'idpf_cap_field'
> drivers/net/ethernet/intel/idpf/idpf.h:130: warning: Enum value
> 'hsplit_caps' not described in enum 'idpf_cap_field'
> drivers/net/ethernet/intel/idpf/idpf.h:130: warning: Enum value
> 'rsc_caps' not described in enum 'idpf_cap_field'
> drivers/net/ethernet/intel/idpf/idpf.h:130: warning: Enum value
> 'other_caps' not described in enum 'idpf_cap_field'
>
> Fix it by removing the macro arguments within the parentheses.
>
> Signed-off-by: Pavan Kumar Linga <pavan.kumar.linga@intel.com>
> ---
>  scripts/kernel-doc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index cfb1cb223508..bc008f30f3c9 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1353,6 +1353,7 @@ sub dump_enum($$) {
>  	my %_members;
>  
>  	$members =~ s/\s+$//;
> +	$members =~ s/\(.*?[\)]//g;

".*" matches the empty string, so * think the "?" is unnecessary.

I do worry that this regex could match more than expected, disappearing
everything up to a final parenthesis.  It doesn't cause any changes in
the current docs build, but still ... How do you feel about replacing
".*" with "[^;]*" ?

Thanks,

jon

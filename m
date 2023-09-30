Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC9A7B42E9
	for <lists+linux-doc@lfdr.de>; Sat, 30 Sep 2023 20:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234708AbjI3SN2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 30 Sep 2023 14:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbjI3SN1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 30 Sep 2023 14:13:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA0DEE1
        for <linux-doc@vger.kernel.org>; Sat, 30 Sep 2023 11:13:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62343C433C8;
        Sat, 30 Sep 2023 18:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696097605;
        bh=AXSbW84HqL8W9RRhyOZzCcIfK3FdChcmeWqoFW2SS+Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qR/Fg3ETJodEvmqFJFVbM0sOzheZ2Fi+EklrtYrtT81INb5tGx81e8NhUFbOoLcM6
         lloKSJhotyEHWB7SdSE2aLtVtG31+L4Y6Ht52Lfs+vR7UQGuflM+ZRf/8aAjYxTpaz
         gFb2Mczunwhb3vMCebHDgj9TX9PX7kSns0BX+a33JtBImu3KyjuUl8hWtVvewd8ndd
         dmdqc5Z1c7nusZkK+SXD6ADTGxr3rvI2KN5AvZXTlnF4n+9XbeIXxkCUgtKojuc6D0
         StUexVRy7jb4e7Xaw/ZV7gKRCIT+KjAuvPKGuecr3ILElKLAF2jhUxse3qKdceMhkT
         DE7bOH44ECaMg==
Date:   Sat, 30 Sep 2023 20:13:20 +0200
From:   Simon Horman <horms@kernel.org>
To:     Benjamin Poirier <bpoirier@nvidia.com>
Cc:     Liang Chen <liangchen.linux@gmail.com>, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        corbet@lwn.net, netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        gregkh@linuxfoundation.org, keescook@chromium.org, Jason@zx2c4.com,
        djwong@kernel.org, jack@suse.cz, linyunsheng@huawei.com,
        ulf.hansson@linaro.org
Subject: Re: [PATCH net-next v5 1/2] pktgen: Automate flag enumeration for
 unknown flag handling
Message-ID: <20230930181320.GE92317@kernel.org>
References: <20230920125658.46978-1-liangchen.linux@gmail.com>
 <20230928112108.GE24230@kernel.org>
 <ZRV9EO8JauF3O8tx@d3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRV9EO8JauF3O8tx@d3>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 28, 2023 at 09:18:08AM -0400, Benjamin Poirier wrote:
> On 2023-09-28 13:21 +0200, Simon Horman wrote:
> > On Wed, Sep 20, 2023 at 08:56:57PM +0800, Liang Chen wrote:
> > > When specifying an unknown flag, it will print all available flags.
> > > Currently, these flags are provided as fixed strings, which requires
> > > manual updates when flags change. Replacing it with automated flag
> > > enumeration.
> > > 
> > > Signed-off-by: Liang Chen <liangchen.linux@gmail.com>
> > > Signed-off-by: Benjamin Poirier <bpoirier@nvidia.com>
> > > ---
> > >  Changes from v3:
> > > - check "n == IPSEC_SHIFT" instead of string comparison
> > > - use snprintf and check that the result does not overrun pkg_dev->result[]
> > > - avoid double '\n' at the end
> 
>       ^
> 
> [...]
> 
> > > -		} else {
> > > -			sprintf(pg_result,
> > > -				"Flag -:%s:- unknown\nAvailable flags, (prepend ! to un-set flag):\n%s",
> > > -				f,
> > > -				"IPSRC_RND, IPDST_RND, UDPSRC_RND, UDPDST_RND, "
> > > -				"MACSRC_RND, MACDST_RND, TXSIZE_RND, IPV6, "
> > > -				"MPLS_RND, VID_RND, SVID_RND, FLOW_SEQ, "
> > > -				"QUEUE_MAP_RND, QUEUE_MAP_CPU, UDPCSUM, "
> > > -				"NO_TIMESTAMP, "
> > > -#ifdef CONFIG_XFRM
> > > -				"IPSEC, "
> > > -#endif
> > > -				"NODE_ALLOC\n");
> > > +
> > > +			sprintf(pg_result, "OK: flags=0x%x", pkt_dev->flags);
> > >  			return count;
> > >  		}
> > > -		sprintf(pg_result, "OK: flags=0x%x", pkt_dev->flags);
> > > +
> > > +		/* Unknown flag */
> > > +		end = pkt_dev->result + sizeof(pkt_dev->result);
> > > +		pg_result += sprintf(pg_result,
> > > +			"Flag -:%s:- unknown\n"
> > > +			"Available flags, (prepend ! to un-set flag):\n", f);
> > > +
> > > +		for (int n = 0; n < NR_PKT_FLAGS && pg_result < end; n++) {
> > > +			if (!IS_ENABLED(CONFIG_XFRM) && n == IPSEC_SHIFT)
> > > +				continue;
> > > +			pg_result += snprintf(pg_result, end - pg_result,
> > > +					      "%s, ", pkt_flag_names[n]);
> > > +		}
> > > +		if (!WARN_ON_ONCE(pg_result >= end)) {
> > > +			/* Remove the comma and whitespace at the end */
> > > +			*(pg_result - 2) = '\0';
> > 
> > Hi Liang Chen,
> > 
> > Should the string have a trailing '\n' in keeping with the current formatting?
> 
> A '\n' is already added when the string is output by pktgen_if_show() so
> if the string above has a trailing '\n', it leads to an empty line in
> the output.
> 
> If my count is correct, before this patch there are 56 cases that output
> to pkt_dev->result/pg_result in pktgen_if_write() and only 3 of them
> include a trailing '\n', arguably by mistake.
> 
> So, I think it's better to remove the empty line than to keep the
> current formatting.

Thanks for the clarification.

I have no further objections, but if the patch is resupn for some other
reason, then it might be worth mentioning this in the patch description.

Reviewed-by: Simon Horman <horms@kernel.org>


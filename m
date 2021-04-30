Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84BB236F971
	for <lists+linux-doc@lfdr.de>; Fri, 30 Apr 2021 13:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbhD3Ljc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 30 Apr 2021 07:39:32 -0400
Received: from void.so ([95.85.17.176]:44328 "EHLO void.so"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229875AbhD3Ljb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 30 Apr 2021 07:39:31 -0400
Received: from void.so (localhost [127.0.0.1])
        by void.so (Postfix) with ESMTP id 58BF12B2FBA;
        Fri, 30 Apr 2021 14:38:41 +0300 (MSK)
Received: from void.so ([127.0.0.1])
        by void.so (void.so [127.0.0.1]) (amavisd-new, port 10024) with LMTP
        id xCxw9Rm9qw44; Fri, 30 Apr 2021 14:38:39 +0300 (MSK)
Received: from rnd (unknown [91.244.183.205])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by void.so (Postfix) with ESMTPSA id D82902B2FB9;
        Fri, 30 Apr 2021 14:38:38 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=void.so; s=mail;
        t=1619782719; bh=V6onwt1F5wGt+Hf4yEB8hcUXrVlg0oWpCp/OSMVZiks=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=fctcNFkAyg5qeL0P7UoxDSk2wCBxuLIugynuKxEIWBP/Lw3Cr1y80GlEj1NXorsQk
         KEffakuvlsUu6u+LbAZ/VrTdu1eOhpTLknwkrHXeG0BmyQKgwGg+05gunYgy7uaLC6
         zdyI5sSje/fhuDkOCWlmvAFJyuI4xpZvC5URwmdM=
Date:   Fri, 30 Apr 2021 14:36:49 +0300
From:   Pavel Balaev <mail@void.so>
To:     Ido Schimmel <idosch@idosch.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>,
        Shuah Khan <shuah@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ido Schimmel <idosch@nvidia.com>
Subject: Re: [PATCH v6 net-next 1/3] net/ipv4: multipath routing:
 configurable seed
Message-ID: <YIvr0bohU95kDzU+@rnd>
References: <YIlVpYMCn/8WfE1P@rnd>
 <YIrQ0Nyse0fnwpEC@shredder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YIrQ0Nyse0fnwpEC@shredder.lan>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 29, 2021 at 06:29:20PM +0300, Ido Schimmel wrote:
> On Wed, Apr 28, 2021 at 03:31:33PM +0300, Pavel Balaev wrote:
> > Ability for a user to assign seed value to multipath route hashes.
> > Now kernel uses random seed value to prevent hash-flooding DoS attacks;
> > however, it disables some use cases, f.e:
> > 
> > +-------+        +------+        +--------+
> > |       |-eth0---| FW0  |---eth0-|        |
> > |       |        +------+        |        |
> > |  GW0  |ECMP                ECMP|  GW1   |
> > |       |        +------+        |        |
> > |       |-eth1---| FW1  |---eth1-|        |
> > +-------+        +------+        +--------+
> > 
> > In this use case, two ECMP routers balance traffic between two firewalls.
> > If some flow transmits a response over a different channel than request,
> > such flow will be dropped, because keep-state rules are created on
> > the other firewall.
> > 
> > This patch adds sysctl variable: net.ipv4.fib_multipath_hash_seed.
> > User can set the same seed value on GW0 and GW1 for traffic to be
> > mirror-balanced. By default, random value is used.
> > 
> > Signed-off-by: Pavel Balaev <balaevpa@infotecs.ru>
> > ---
> >  Documentation/networking/ip-sysctl.rst | 14 ++++
> >  include/net/flow_dissector.h           |  2 +
> >  include/net/netns/ipv4.h               |  2 +
> >  net/core/flow_dissector.c              |  7 ++
> >  net/ipv4/route.c                       | 10 ++-
> >  net/ipv4/sysctl_net_ipv4.c             | 97 ++++++++++++++++++++++++++
> >  6 files changed, 131 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
> > index 9701906f6..d1a67e6fe 100644
> > --- a/Documentation/networking/ip-sysctl.rst
> > +++ b/Documentation/networking/ip-sysctl.rst
> > @@ -100,6 +100,20 @@ fib_multipath_hash_policy - INTEGER
> >  	- 1 - Layer 4
> >  	- 2 - Layer 3 or inner Layer 3 if present
> >  
> > +fib_multipath_hash_seed - STRING
> > +	Controls seed value for multipath route hashes. By default
> > +	random value is used. Only valid for kernels built with
> > +	CONFIG_IP_ROUTE_MULTIPATH enabled.
> > +
> > +	Valid format: two hex values set off with comma or "random"
> > +	keyword.
> > +
> > +	Example to generate the seed value::
> > +
> > +		RAND=$(openssl rand -hex 16) && echo "${RAND:0:16},${RAND:16:16}"
> > +
> > +	Default: "random"
> > +
> >  fib_sync_mem - UNSIGNED INTEGER
> >  	Amount of dirty memory from fib entries that can be backlogged before
> >  	synchronize_rcu is forced.
> > diff --git a/include/net/flow_dissector.h b/include/net/flow_dissector.h
> > index ffd386ea0..d104c013a 100644
> > --- a/include/net/flow_dissector.h
> > +++ b/include/net/flow_dissector.h
> > @@ -348,6 +348,8 @@ static inline bool flow_keys_have_l4(const struct flow_keys *keys)
> >  }
> >  
> >  u32 flow_hash_from_keys(struct flow_keys *keys);
> > +u32 flow_multipath_hash_from_keys(struct flow_keys *keys,
> > +			   const siphash_key_t *seed);
> >  void skb_flow_get_icmp_tci(const struct sk_buff *skb,
> >  			   struct flow_dissector_key_icmp *key_icmp,
> >  			   const void *data, int thoff, int hlen);
> > diff --git a/include/net/netns/ipv4.h b/include/net/netns/ipv4.h
> > index 87e161249..cb2830432 100644
> > --- a/include/net/netns/ipv4.h
> > +++ b/include/net/netns/ipv4.h
> > @@ -222,6 +222,8 @@ struct netns_ipv4 {
> >  #ifdef CONFIG_IP_ROUTE_MULTIPATH
> >  	u8 sysctl_fib_multipath_use_neigh;
> >  	u8 sysctl_fib_multipath_hash_policy;
> > +	int sysctl_fib_multipath_hash_seed;
> 
> Why 'int'?
>
will fix it, thanks
> > +	siphash_key_t __rcu *fib_multipath_hash_seed_ctx;
> >  #endif
> >  
> >  	struct fib_notifier_ops	*notifier_ops;
> > diff --git a/net/core/flow_dissector.c b/net/core/flow_dissector.c
> > index 5985029e4..febd1094c 100644
> > --- a/net/core/flow_dissector.c
> > +++ b/net/core/flow_dissector.c
> > @@ -1560,6 +1560,13 @@ u32 flow_hash_from_keys(struct flow_keys *keys)
> >  }
> >  EXPORT_SYMBOL(flow_hash_from_keys);
> >  
> > +u32 flow_multipath_hash_from_keys(struct flow_keys *keys,
> > +				  const siphash_key_t *seed)
> > +{
> > +	return __flow_hash_from_keys(keys, seed);
> > +}
> > +EXPORT_SYMBOL(flow_multipath_hash_from_keys);
> > +
> >  static inline u32 ___skb_get_hash(const struct sk_buff *skb,
> >  				  struct flow_keys *keys,
> >  				  const siphash_key_t *keyval)
> > diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> > index f6787c55f..79866b429 100644
> > --- a/net/ipv4/route.c
> > +++ b/net/ipv4/route.c
> > @@ -1912,6 +1912,7 @@ int fib_multipath_hash(const struct net *net, const struct flowi4 *fl4,
> >  {
> >  	u32 multipath_hash = fl4 ? fl4->flowi4_multipath_hash : 0;
> >  	struct flow_keys hash_keys;
> > +	siphash_key_t *seed_ctx;
> >  	u32 mhash;
> >  
> >  	switch (net->ipv4.sysctl_fib_multipath_hash_policy) {
> > @@ -1989,7 +1990,14 @@ int fib_multipath_hash(const struct net *net, const struct flowi4 *fl4,
> >  		}
> >  		break;
> >  	}
> > -	mhash = flow_hash_from_keys(&hash_keys);
> > +
> > +	rcu_read_lock();
> > +	seed_ctx = rcu_dereference(net->ipv4.fib_multipath_hash_seed_ctx);
> > +	if (seed_ctx)
> > +		mhash = flow_multipath_hash_from_keys(&hash_keys, seed_ctx);
> > +	else
> > +		mhash = flow_hash_from_keys(&hash_keys);
> > +	rcu_read_unlock();
> 
> During netns initialization the per-netns seed can be initialized to a
> system global seed. When the sysctl is used this seed will be
> overridden. You can then remove this check and always call
> flow_multipath_hash_from_keys() with the per-netns seed.
> 
> I'm not suggesting to initialize the seed of each netns differently as
> some users might be inadvertently relying on the fact that it is
> currently the same for all namespaces.
>
Good idea, thanks, will fix it.
> >  
> >  	if (multipath_hash)
> >  		mhash = jhash_2words(mhash, multipath_hash, 0);
> > diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
> > index a09e466ce..5dff59733 100644
> > --- a/net/ipv4/sysctl_net_ipv4.c
> > +++ b/net/ipv4/sysctl_net_ipv4.c
> > @@ -447,6 +447,8 @@ static int proc_tcp_available_ulp(struct ctl_table *ctl,
> >  }
> >  
> >  #ifdef CONFIG_IP_ROUTE_MULTIPATH
> > +#define FIB_MULTIPATH_SEED_KEY_LENGTH sizeof(siphash_key_t)
> > +#define FIB_MULTIPATH_SEED_RANDOM "random"
> >  static int proc_fib_multipath_hash_policy(struct ctl_table *table, int write,
> >  					  void *buffer, size_t *lenp,
> >  					  loff_t *ppos)
> > @@ -461,6 +463,93 @@ static int proc_fib_multipath_hash_policy(struct ctl_table *table, int write,
> >  
> >  	return ret;
> >  }
> > +
> > +static int proc_fib_multipath_hash_seed(struct ctl_table *table, int write,
> > +					void *buffer, size_t *lenp,
> > +					loff_t *ppos)
> > +{
> > +	struct net *net = container_of(table->data, struct net,
> > +	    ipv4.sysctl_fib_multipath_hash_seed);
> > +	/* maxlen to print the keys in hex (*2) and a comma in between keys. */
> > +	struct ctl_table tbl = {
> > +		.maxlen = ((FIB_MULTIPATH_SEED_KEY_LENGTH * 2) + 2)
> > +	};
> > +	siphash_key_t user_key, *ctx;
> > +	__le64 key[2];
> > +	int ret;
> > +
> > +	tbl.data = kmalloc(tbl.maxlen, GFP_KERNEL);
> > +
> > +	if (!tbl.data)
> > +		return -ENOMEM;
> > +
> > +	rcu_read_lock();
> > +	ctx = rcu_dereference(net->ipv4.fib_multipath_hash_seed_ctx);
> > +	if (ctx) {
> > +		put_unaligned_le64(ctx->key[0], &key[0]);
> > +		put_unaligned_le64(ctx->key[1], &key[1]);
> > +		user_key.key[0] = le64_to_cpu(key[0]);
> > +		user_key.key[1] = le64_to_cpu(key[1]);
> > +
> > +		snprintf(tbl.data, tbl.maxlen, "%016llx,%016llx",
> > +			 user_key.key[0], user_key.key[1]);
> > +	} else {
> > +		snprintf(tbl.data, tbl.maxlen, "%s", FIB_MULTIPATH_SEED_RANDOM);
> > +	}
> > +	rcu_read_unlock();
> > +
> > +	ret = proc_dostring(&tbl, write, buffer, lenp, ppos);
> > +
> > +	if (write && ret == 0) {
> 
> You can reduce nesting by using early return.

OK, got it!
> > +		siphash_key_t *new_ctx, *old_ctx;
> > +
> > +		if (!strcmp(tbl.data, FIB_MULTIPATH_SEED_RANDOM)) {
> > +			rtnl_lock();
> > +			old_ctx = rtnl_dereference(net->ipv4.fib_multipath_hash_seed_ctx);
> > +			RCU_INIT_POINTER(net->ipv4.fib_multipath_hash_seed_ctx, NULL);
> > +			rtnl_unlock();
> > +			if (old_ctx) {
> > +				synchronize_net();
> > +				kfree_sensitive(old_ctx);
> > +			}
> > +
> > +			pr_debug("multipath hash seed set to random value\n");
> > +			goto out;
> > +		}
> > +
> > +		if (sscanf(tbl.data, "%llx,%llx", user_key.key, user_key.key + 1) != 2) {
> > +			ret = -EINVAL;
> > +			goto out;
> > +		}
> > +
> > +		key[0] = cpu_to_le64(user_key.key[0]);
> > +		key[1] = cpu_to_le64(user_key.key[1]);
> > +		pr_debug("multipath hash seed set to 0x%llx,0x%llx\n",
> > +			 user_key.key[0], user_key.key[1]);
> 
> This leaks the seed... I understand how these prints can be useful
> during development, but I believe they should be removed prior to
> submission.

Thanks, forgot to remove this.
> > +
> > +		new_ctx = kmalloc(sizeof(*new_ctx), GFP_KERNEL);
> > +		if (!new_ctx) {
> > +			ret = -ENOMEM;
> > +			goto out;
> > +		}
> > +
> > +		new_ctx->key[0] = get_unaligned_le64(&key[0]);
> > +		new_ctx->key[1] = get_unaligned_le64(&key[1]);
> > +
> > +		rtnl_lock();
> > +		old_ctx = rtnl_dereference(net->ipv4.fib_multipath_hash_seed_ctx);
> > +		rcu_assign_pointer(net->ipv4.fib_multipath_hash_seed_ctx, new_ctx);
> > +		rtnl_unlock();
> > +		if (old_ctx) {
> > +			synchronize_net();
> > +			kfree_sensitive(old_ctx);
> > +		}
> > +	}
> 
> This looks overly complex to me and I believe a lot of users will ask
> themselves why they need to specify a seed using two hex numbers
> separated by a comma. Looking at other implementations that already
> allow specifying the seed, it is specified as a single integer.
> 
> 32-bit in Cumulus:
> https://docs.nvidia.com/networking-ethernet-software/cumulus-linux-43/Layer-3/Routing/Equal-Cost-Multipath-Load-Sharing-Hardware-ECMP/#configure-a-hash-seed-to-avoid-hash-polarization
> 
> Up to 16-bit in Arista:
> https://eos.arista.com/hashing-for-l2-port-channels-and-l3-ecmp/
> 
> I believe you chose this interface because of the structure of the
> SipHash key that is used for the multipath hash calculation. This is an
> internal implementation detail and should not determine the user
> interface.
> 
> Looking at the history of the code, the flow dissector was migrated to
> SipHash in commit 55667441c84f ("net/flow_dissector: switch to
> siphash"). The motivating use case was flow label generation since these
> are sent on the wire together with the fields from which they were
> computed, not multipath hash calculation that also happens to rely on
> the flow dissector.
> 
> Given the above, do you see a problem with having the user specify a
> 32-bit number for the multipath hash seed? Note that SipHash is still
> used and that the number can be used to fill the entire 128-bit space.

Do you mean take 32-bit number from user and multiply it like this:
u32 key = val;
u64 key64;
memset(&key64, val, sizeof(u32));
memset(&key64 + sizeof(u32), val, sizeof(u32));
memset(seed.key[0], &key64, sizeof(u64));
memset(seed.key[1], &key64, sizeof(u64));
?
> The special value of "0" can be used to revert back to the random seed
> (needs to be documented, obviously).
> 
Got it!
> > +
> > +out:
> > +	kfree(tbl.data);
> > +	return ret;
> > +}
> >  #endif
> >  
> >  static struct ctl_table ipv4_table[] = {
> > @@ -1052,6 +1141,14 @@ static struct ctl_table ipv4_net_table[] = {
> >  		.extra1		= SYSCTL_ZERO,
> >  		.extra2		= &two,
> >  	},
> > +	{
> > +		.procname	= "fib_multipath_hash_seed",
> > +		.data		= &init_net.ipv4.sysctl_fib_multipath_hash_seed,
> > +		/* maxlen to print the keys in hex (*2) and a comma in between keys. */
> > +		.maxlen		= (FIB_MULTIPATH_SEED_KEY_LENGTH * 2) + 2,
> > +		.mode		= 0600,
> > +		.proc_handler	= proc_fib_multipath_hash_seed,
> > +	},
> >  #endif
> >  	{
> >  		.procname	= "ip_unprivileged_port_start",
> > -- 
> > 2.31.1
> > 

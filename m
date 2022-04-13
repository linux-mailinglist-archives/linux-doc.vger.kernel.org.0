Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC494FF908
	for <lists+linux-doc@lfdr.de>; Wed, 13 Apr 2022 16:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236142AbiDMOhR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 Apr 2022 10:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233994AbiDMOhQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Apr 2022 10:37:16 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D093606D8
        for <linux-doc@vger.kernel.org>; Wed, 13 Apr 2022 07:34:53 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id n22so1837888pfa.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Apr 2022 07:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CIsNfPRidIIb5w/SYfIH9yDnHL/BsniyVDIkT3SgKfE=;
        b=cZces3/TX0L42HH5c7+xdCKMeClrHdOe6cQo5eOl2pHiJhItiP68v8/rJ1lXTVLM4M
         /G8V8fyfivYMeuzK8+Z0SUDyq4YVFEdywCfv+C+v1uc/CMrRn7Iy619z+4/mN5AUxpoi
         yw85g0lEHSTp/Qg5lBBYJukxmC6eTX4Kl5dyKyx8G87h8KA6TH4zWpkWc8UZd7D1PmqL
         SyQq99ecyH2UB3zYlfny0bZq7DCHldmdyekUY3xdlnsd21993bGZzCllUZniUBwNU1MU
         6trOxRfECcOtObxE/XFPRgFSy9hp/EunhWEKAixvIDPhCCkQuHDhWXoGKEbC8Dy2zrbN
         Ggdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CIsNfPRidIIb5w/SYfIH9yDnHL/BsniyVDIkT3SgKfE=;
        b=5ffpwvLzmqNj6BltSEkigbv+40SFtTnhFq/MtAOsgsJTr82F3piaULyBXimtGnYQD7
         ReKUAjY4bnMoWHNyjYrpJyyig/Eqwo7RDjzp1X6aH8b9QYh3BDJVmwlsbnjjvP7QJ0c/
         yH8OUKKPZqMhxF3EUg3k6QzedB9P/RKdlGJOVHg69XwvrkTvfeUAL6gBhz2td+u/uA1c
         2BicdJ3Ufyz+ICalKeYnFDYswk51zi2IcvxNQWzjx87cqLVXR2NvWslSdpVkIuLyCMBM
         Ms1C0naZnEEh9YU8SFinvlqXZ9H/ryVuc3yOebo+wulqpK0ahscRV6T7/DW8XMPZ5COU
         I6SQ==
X-Gm-Message-State: AOAM533wHKyPcw6Alf6GoEpC9jOQA17IHd2rMOvL4PffO8UAhpgzcY2d
        VT3pgvcZtGB65riLN6b+8Ehd+A==
X-Google-Smtp-Source: ABdhPJxsOp9HkFtEvCCysqwpqV1XI4MvKtyxfGpt0EZC80W3r5iXZoMS85u0uRuSecwUSEYKupt2VQ==
X-Received: by 2002:a63:ff03:0:b0:39d:ac7f:d97a with SMTP id k3-20020a63ff03000000b0039dac7fd97amr4148248pgi.362.1649860491922;
        Wed, 13 Apr 2022 07:34:51 -0700 (PDT)
Received: from localhost.localdomain ([49.37.166.144])
        by smtp.gmail.com with ESMTPSA id l2-20020a056a0016c200b004f7e3181a41sm45194705pfc.98.2022.04.13.07.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 07:34:50 -0700 (PDT)
From:   Arun Ajith S <aajith@arista.com>
To:     netdev@vger.kernel.org
Cc:     davem@davemloft.net, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, dsahern@kernel.org,
        yoshfuji@linux-ipv6.org, kuba@kernel.org, pabeni@redhat.com,
        corbet@lwn.net, prestwoj@gmail.com, gilligan@arista.com,
        noureddine@arista.com, gk@arista.com, aajith@arista.com
Subject: [PATCH net-next v3] net/ipv6: Introduce accept_unsolicited_na knob to implement router-side changes for RFC9131
Date:   Wed, 13 Apr 2022 14:34:34 +0000
Message-Id: <20220413143434.527-1-aajith@arista.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new neighbour cache entry in STALE state for routers on receiving
an unsolicited (gratuitous) neighbour advertisement with
target link-layer-address option specified.
This is similar to the arp_accept configuration for IPv4.
A new sysctl endpoint is created to turn on this behaviour:
/proc/sys/net/ipv6/conf/interface/accept_unsolicited_na.

Signed-off-by: Arun Ajith S <aajith@arista.com>
---
 Documentation/networking/ip-sysctl.rst        |  23 ++
 include/linux/ipv6.h                          |   1 +
 include/uapi/linux/ipv6.h                     |   1 +
 net/ipv6/addrconf.c                           |  10 +
 net/ipv6/ndisc.c                              |  20 +-
 tools/testing/selftests/net/Makefile          |   1 +
 .../net/ndisc_unsolicited_na_test.py          | 255 ++++++++++++++++++
 7 files changed, 310 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/ndisc_unsolicited_na_test.py

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index b0024aa7b051..9e17efe343ac 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -2467,6 +2467,29 @@ drop_unsolicited_na - BOOLEAN
 
 	By default this is turned off.
 
+accept_unsolicited_na - BOOLEAN
+	Add a new neighbour cache entry in STALE state for routers on receiving an
+	unsolicited neighbour advertisement with target link-layer address option
+	specified. This is as per router-side behavior documented in RFC9131.
+	This has lower precedence than drop_unsolicited_na.
+	 drop   accept  fwding                   behaviour
+	 ----   ------  ------  ----------------------------------------------
+	    1        X       X  Drop NA packet and don't pass up the stack
+	    0        0       X  Pass NA packet up the stack, don't update NC
+	    0        1       0  Pass NA packet up the stack, don't update NC
+	    0        1       1  Pass NA packet up the stack, and add a STALE
+	                          NC entry
+	This will optimize the return path for the initial off-link communication
+	that is initiated by a directly connected host, by ensuring that
+	the first-hop router which turns on this setting doesn't have to
+	buffer the initial return packets to do neighbour-solicitation.
+	The prerequisite is that the host is configured to send
+	unsolicited neighbour advertisements on interface bringup.
+	This setting should be used in conjunction with the ndisc_notify setting
+	on the host to satisfy this prerequisite.
+
+	By default this is turned off.
+
 enhanced_dad - BOOLEAN
 	Include a nonce option in the IPv6 neighbor solicitation messages used for
 	duplicate address detection per RFC7527. A received DAD NS will only signal
diff --git a/include/linux/ipv6.h b/include/linux/ipv6.h
index 16870f86c74d..918bfea4ef5f 100644
--- a/include/linux/ipv6.h
+++ b/include/linux/ipv6.h
@@ -61,6 +61,7 @@ struct ipv6_devconf {
 	__s32		suppress_frag_ndisc;
 	__s32		accept_ra_mtu;
 	__s32		drop_unsolicited_na;
+	__s32		accept_unsolicited_na;
 	struct ipv6_stable_secret {
 		bool initialized;
 		struct in6_addr secret;
diff --git a/include/uapi/linux/ipv6.h b/include/uapi/linux/ipv6.h
index d4178dace0bf..549ddeaf788b 100644
--- a/include/uapi/linux/ipv6.h
+++ b/include/uapi/linux/ipv6.h
@@ -194,6 +194,7 @@ enum {
 	DEVCONF_IOAM6_ID,
 	DEVCONF_IOAM6_ID_WIDE,
 	DEVCONF_NDISC_EVICT_NOCARRIER,
+	DEVCONF_ACCEPT_UNSOLICITED_NA,
 	DEVCONF_MAX
 };
 
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 1afc4c024981..6473dc84b71d 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -5587,6 +5587,7 @@ static inline void ipv6_store_devconf(struct ipv6_devconf *cnf,
 	array[DEVCONF_IOAM6_ID] = cnf->ioam6_id;
 	array[DEVCONF_IOAM6_ID_WIDE] = cnf->ioam6_id_wide;
 	array[DEVCONF_NDISC_EVICT_NOCARRIER] = cnf->ndisc_evict_nocarrier;
+	array[DEVCONF_ACCEPT_UNSOLICITED_NA] = cnf->accept_unsolicited_na;
 }
 
 static inline size_t inet6_ifla6_size(void)
@@ -7037,6 +7038,15 @@ static const struct ctl_table addrconf_sysctl[] = {
 		.extra1		= (void *)SYSCTL_ZERO,
 		.extra2		= (void *)SYSCTL_ONE,
 	},
+	{
+		.procname	= "accept_unsolicited_na",
+		.data		= &ipv6_devconf.accept_unsolicited_na,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec,
+		.extra1		= (void *)SYSCTL_ZERO,
+		.extra2		= (void *)SYSCTL_ONE,
+	},
 	{
 		/* sentinel */
 	}
diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
index fcb288b0ae13..254addad0dd3 100644
--- a/net/ipv6/ndisc.c
+++ b/net/ipv6/ndisc.c
@@ -979,6 +979,7 @@ static void ndisc_recv_na(struct sk_buff *skb)
 	struct inet6_dev *idev = __in6_dev_get(dev);
 	struct inet6_ifaddr *ifp;
 	struct neighbour *neigh;
+	bool create_neigh;
 
 	if (skb->len < sizeof(struct nd_msg)) {
 		ND_PRINTK(2, warn, "NA: packet too short\n");
@@ -999,6 +1000,7 @@ static void ndisc_recv_na(struct sk_buff *skb)
 	/* For some 802.11 wireless deployments (and possibly other networks),
 	 * there will be a NA proxy and unsolicitd packets are attacks
 	 * and thus should not be accepted.
+	 * drop_unsolicited_na takes precedence over accept_unsolicited_na
 	 */
 	if (!msg->icmph.icmp6_solicited && idev &&
 	    idev->cnf.drop_unsolicited_na)
@@ -1039,7 +1041,23 @@ static void ndisc_recv_na(struct sk_buff *skb)
 		in6_ifa_put(ifp);
 		return;
 	}
-	neigh = neigh_lookup(&nd_tbl, &msg->target, dev);
+	/* RFC 9131 updates original Neighbour Discovery RFC 4861.
+	 * An unsolicited NA can now create a neighbour cache entry
+	 * on routers if it has Target LL Address option.
+	 *
+	 * drop   accept  fwding                   behaviour
+	 * ----   ------  ------  ----------------------------------------------
+	 *    1        X       X  Drop NA packet and don't pass up the stack
+	 *    0        0       X  Pass NA packet up the stack, don't update NC
+	 *    0        1       0  Pass NA packet up the stack, don't update NC
+	 *    0        1       1  Pass NA packet up the stack, and add a STALE
+	 *                          NC entry
+	 * Note that we don't do a (daddr == all-routers-mcast) check.
+	 */
+	create_neigh = !msg->icmph.icmp6_solicited && lladdr &&
+		       idev && idev->cnf.forwarding &&
+		       idev->cnf.accept_unsolicited_na;
+	neigh = __neigh_lookup(&nd_tbl, &msg->target, dev, create_neigh);
 
 	if (neigh) {
 		u8 old_flags = neigh->flags;
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 3fe2515aa616..69415dbb61d2 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -36,6 +36,7 @@ TEST_PROGS += srv6_end_dt4_l3vpn_test.sh
 TEST_PROGS += srv6_end_dt6_l3vpn_test.sh
 TEST_PROGS += vrf_strict_mode_test.sh
 TEST_PROGS += arp_ndisc_evict_nocarrier.sh
+TEST_PROGS += ndisc_unsolicited_na_test.py
 TEST_PROGS_EXTENDED := in_netns.sh setup_loopback.sh setup_veth.sh
 TEST_PROGS_EXTENDED += toeplitz_client.sh toeplitz.sh
 TEST_GEN_FILES =  socket nettest
diff --git a/tools/testing/selftests/net/ndisc_unsolicited_na_test.py b/tools/testing/selftests/net/ndisc_unsolicited_na_test.py
new file mode 100755
index 000000000000..f508657ee126
--- /dev/null
+++ b/tools/testing/selftests/net/ndisc_unsolicited_na_test.py
@@ -0,0 +1,255 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+# This test is for the accept_unsolicited_na feature to
+# enable RFC9131 behaviour. The following is the test-matrix.
+# drop   accept  fwding                   behaviour
+# ----   ------  ------  ----------------------------------------------
+#    1        X       X  Drop NA packet and don't pass up the stack
+#    0        0       X  Pass NA packet up the stack, don't update NC
+#    0        1       0  Pass NA packet up the stack, don't update NC
+#    0        1       1  Pass NA packet up the stack, and add a STALE
+#                           NC entry
+
+ret=0
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
+PAUSE_ON_FAIL=no
+PAUSE=no
+
+HOST_NS="ns-host"
+ROUTER_NS="ns-router"
+
+HOST_INTF="veth-host"
+ROUTER_INTF="veth-router"
+
+ROUTER_ADDR="2000:20::1"
+HOST_ADDR="2000:20::2"
+SUBNET_WIDTH=64
+ROUTER_ADDR_WITH_MASK="${ROUTER_ADDR}/${SUBNET_WIDTH}"
+HOST_ADDR_WITH_MASK="${HOST_ADDR}/${SUBNET_WIDTH}"
+
+IP_HOST="ip -6 -netns ${HOST_NS}"
+IP_HOST_EXEC="ip netns exec ${HOST_NS}"
+IP_ROUTER="ip -6 -netns ${ROUTER_NS}"
+IP_ROUTER_EXEC="ip netns exec ${ROUTER_NS}"
+
+tcpdump_stdout=
+tcpdump_stderr=
+
+log_test()
+{
+	local rc=$1
+	local expected=$2
+	local msg="$3"
+
+	if [ ${rc} -eq ${expected} ]; then
+		printf "    TEST: %-60s  [ OK ]\n" "${msg}"
+		nsuccess=$((nsuccess+1))
+	else
+		ret=1
+		nfail=$((nfail+1))
+		printf "    TEST: %-60s  [FAIL]\n" "${msg}"
+		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
+		echo
+			echo "hit enter to continue, 'q' to quit"
+			read a
+			[ "$a" = "q" ] && exit 1
+		fi
+	fi
+
+	if [ "${PAUSE}" = "yes" ]; then
+		echo
+		echo "hit enter to continue, 'q' to quit"
+		read a
+		[ "$a" = "q" ] && exit 1
+	fi
+}
+
+setup()
+{
+	set -e
+
+	local drop_unsolicited_na=$1
+	local accept_unsolicited_na=$2
+	local forwarding=$3
+
+	# Setup two namespaces and a veth tunnel across them.
+	# On end of the tunnel is a router and the other end is a host.
+	ip netns add ${HOST_NS}
+	ip netns add ${ROUTER_NS}
+	${IP_ROUTER} link add ${ROUTER_INTF} type veth \
+                peer name ${HOST_INTF} netns ${HOST_NS}
+
+	# Enable IPv6 on both router and host, and configure static addresses.
+	# The router here is the DUT
+	# Setup router configuration as specified by the arguments.
+	# forwarding=0 case is to check that a non-router
+	# doesn't add neighbour entries.
+        ROUTER_CONF=net.ipv6.conf.${ROUTER_INTF}
+	${IP_ROUTER_EXEC} sysctl -qw \
+                ${ROUTER_CONF}.forwarding=${forwarding}
+	${IP_ROUTER_EXEC} sysctl -qw \
+                ${ROUTER_CONF}.drop_unsolicited_na=${drop_unsolicited_na}
+	${IP_ROUTER_EXEC} sysctl -qw \
+                ${ROUTER_CONF}.accept_unsolicited_na=${accept_unsolicited_na}
+	${IP_ROUTER_EXEC} sysctl -qw ${ROUTER_CONF}.disable_ipv6=0
+	${IP_ROUTER} addr add ${ROUTER_ADDR_WITH_MASK} dev ${ROUTER_INTF}
+
+	# Turn on ndisc_notify on host interface so that
+	# the host sends unsolicited NAs.
+	HOST_CONF=net.ipv6.conf.${HOST_INTF}
+	${IP_HOST_EXEC} sysctl -qw ${HOST_CONF}.ndisc_notify=1
+	${IP_HOST_EXEC} sysctl -qw ${HOST_CONF}.disable_ipv6=0
+	${IP_HOST} addr add ${HOST_ADDR_WITH_MASK} dev ${HOST_INTF}
+
+	set +e
+}
+
+start_tcpdump() {
+	set -e
+	tcpdump_stdout=`mktemp`
+	tcpdump_stderr=`mktemp`
+	${IP_ROUTER_EXEC} timeout 15s \
+                tcpdump --immediate-mode -tpni ${ROUTER_INTF} -c 1 \
+                "icmp6 && icmp6[0] == 136 && src ${HOST_ADDR}" \
+                > ${tcpdump_stdout} 2> /dev/null
+	set +e
+}
+
+cleanup_tcpdump()
+{
+	set -e
+	[[ ! -z  ${tcpdump_stdout} ]] && rm -f ${tcpdump_stdout}
+	[[ ! -z  ${tcpdump_stderr} ]] && rm -f ${tcpdump_stderr}
+	tcpdump_stdout=
+	tcpdump_stderr=
+	set +e
+}
+
+cleanup()
+{
+	cleanup_tcpdump
+	ip netns del ${HOST_NS}
+	ip netns del ${ROUTER_NS}
+}
+
+link_up() {
+	set -e
+	${IP_ROUTER} link set dev ${ROUTER_INTF} up
+	${IP_HOST} link set dev ${HOST_INTF} up
+	set +e
+}
+
+verify_ndisc() {
+	local drop_unsolicited_na=$1
+	local accept_unsolicited_na=$2
+	local forwarding=$3
+
+	neigh_show_output=$(${IP_ROUTER} neigh show \
+                to ${HOST_ADDR} dev ${ROUTER_INTF} nud stale)
+	if [ ${drop_unsolicited_na} -eq 0 ] && \
+			[ ${accept_unsolicited_na} -eq 1 ] && \
+			[ ${forwarding} -eq 1 ]; then
+		# Neighbour entry expected to be present for 011 case
+		[[ ${neigh_show_output} ]]
+	else
+		# Neighbour entry expected to be absent for all other cases
+		[[ -z ${neigh_show_output} ]]
+	fi
+}
+
+test_unsolicited_na_common()
+{
+	# Setup the test bed, but keep links down
+	setup $1 $2 $3
+
+	# Bring the link up, wait for the NA,
+	# and add a delay to ensure neighbour processing is done.
+	link_up
+	start_tcpdump
+
+	# Verify the neighbour table
+	verify_ndisc $1 $2 $3
+
+}
+
+test_unsolicited_na_combination() {
+	test_unsolicited_na_common $1 $2 $3
+	test_msg=("test_unsolicited_na: "
+		"drop_unsolicited_na=$1 "
+		"accept_unsolicited_na=$2 "
+		"forwarding=$3")
+	log_test $? 0 "${test_msg[*]}"
+	cleanup
+}
+
+test_unsolicited_na_combinations() {
+	# Args: drop_unsolicited_na accept_unsolicited_na forwarding
+
+	# Expect entry
+	test_unsolicited_na_combination 0 1 1
+
+	# Expect no entry
+	test_unsolicited_na_combination 0 0 0
+	test_unsolicited_na_combination 0 0 1
+	test_unsolicited_na_combination 0 1 0
+	test_unsolicited_na_combination 1 0 0
+	test_unsolicited_na_combination 1 0 1
+	test_unsolicited_na_combination 1 1 0
+	test_unsolicited_na_combination 1 1 1
+}
+
+###############################################################################
+# usage
+
+usage()
+{
+	cat <<EOF
+usage: ${0##*/} OPTS
+        -p          Pause on fail
+        -P          Pause after each test before cleanup
+EOF
+}
+
+###############################################################################
+# main
+
+while getopts :pPh o
+do
+	case $o in
+		p) PAUSE_ON_FAIL=yes;;
+		P) PAUSE=yes;;
+		h) usage; exit 0;;
+		*) usage; exit 1;;
+	esac
+done
+
+# make sure we don't pause twice
+[ "${PAUSE}" = "yes" ] && PAUSE_ON_FAIL=no
+
+if [ "$(id -u)" -ne 0 ];then
+	echo "SKIP: Need root privileges"
+	exit $ksft_skip;
+fi
+
+if [ ! -x "$(command -v ip)" ]; then
+	echo "SKIP: Could not run test without ip tool"
+	exit $ksft_skip
+fi
+
+if [ ! -x "$(command -v tcpdump)" ]; then
+	echo "SKIP: Could not run test without tcpdump tool"
+	exit $ksft_skip
+fi
+
+# start clean
+cleanup &> /dev/null
+
+test_unsolicited_na_combinations
+
+printf "\nTests passed: %3d\n" ${nsuccess}
+printf "Tests failed: %3d\n"   ${nfail}
+
+exit $ret
-- 
2.27.0
---
Changes from v2:
1. Address David Ahern's review comments
 - Remove Tested-by from commit description
 - Add limits to new sysctl with extra1 and extra2
 - Add an unit test, added to TEST_PROGS

Test output:
#  time ./ndisc_unsolicited_na_test.py
    TEST: test_unsolicited_na:  drop_unsolicited_na=0  accept_unsolicited_na=1  forwarding=1  [ OK ]
    TEST: test_unsolicited_na:  drop_unsolicited_na=0  accept_unsolicited_na=0  forwarding=0  [ OK ]
    TEST: test_unsolicited_na:  drop_unsolicited_na=0  accept_unsolicited_na=0  forwarding=1  [ OK ]
    TEST: test_unsolicited_na:  drop_unsolicited_na=0  accept_unsolicited_na=1  forwarding=0  [ OK ]
    TEST: test_unsolicited_na:  drop_unsolicited_na=1  accept_unsolicited_na=0  forwarding=0  [ OK ]
    TEST: test_unsolicited_na:  drop_unsolicited_na=1  accept_unsolicited_na=0  forwarding=1  [ OK ]
    TEST: test_unsolicited_na:  drop_unsolicited_na=1  accept_unsolicited_na=1  forwarding=0  [ OK ]
    TEST: test_unsolicited_na:  drop_unsolicited_na=1  accept_unsolicited_na=1  forwarding=1  [ OK ]

Tests passed:   8
Tests failed:   0

real    0m21.700s
user    0m1.365s
sys     0m0.049s
